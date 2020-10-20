# gitops_man
Project for GitOps using a manifest, Jenkins files

## Jenkins Setup
- Use a RHEL8 instance as **config_node**
- Configure Jenkins Node with label **config_node**
- Configure AWS API credentials
- Configure SSH user credentials for Terraform-launched **RHEL8** endpoints
- Configure GitHub credentials
## Configuration Files
- Configuration is provided in **manifest.default.json**
- Configuration JSON is read by **Jenkinsfile_manifest**
- Infrastructure Pipeline for AWS provider with RHEL VM is provided in **aws_rhel_infra_pipeline**
- Infrastructure Pipeline is backed by Terraform script. Parameters fed by Configuration JSON

## Limitations
- Terraform launched resources on AWS need to manually deleted
