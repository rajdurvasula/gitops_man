output "public_dnsname" {
    value = aws_instance.rhel8_client.*.public_dns
}

output "private_dnsname" {
    value = aws_instance.rhel8_client.*.private_dns
}