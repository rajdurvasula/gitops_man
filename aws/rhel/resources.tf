# AWS connectivity
provider "aws" {
  version = "~> 2.0"
  region = var.my_region
}

# Create Security Group
resource "aws_security_group" "my_sg" {
  vpc_id = var.my_vpc_id
  name = lookup(var.my_vpc_security_groups, "name")
  description = lookup(var.my_vpc_security_groups, "description")

  # Allow Ingress for SSH
  ingress {
    cidr_blocks = [ "${var.ingressCIDRBlock}", "172.31.0.0/20", "172.31.16.0/20", "172.31.32.0/20" ]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  # Allow Ingress for Wildfly App Port
  ingress {
    cidr_blocks = [ var.ingressCIDRBlock, "172.31.0.0/20", "172.31.16.0/20", "172.31.32.0/20" ]
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
  }
  # Allow egress on all ports
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ var.egressCIDRBlock ]
  }
  tags = var.my_tags
}

# Create RHEL8 Instance for testing
resource "aws_instance" "rhel8_client" {
  ami = lookup(var.rhel8_regional_ami, var.my_region)}
  count = var.rhel_inst_count
  instance_type = var.instance_type
  key_name = var.key_pair_name
  vpc_security_group_ids = [ aws_security_group.my_sg.id ]
  subnet_id = var.my_subnet_id
  tags = merge({"Name"="rhel8_client"}, var.my_tags)}
  provisioner "remote-exec" {
    inline = [ "echo 'Hello World'" ]
    connection {
      type = "ssh"
      user = var.ansible_user
      host = aws_instance.rhel8_client[count.index].private_ip
      private_key = file(var.private_key)
    }
  }
}