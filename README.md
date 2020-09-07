# gitops_man
Project for GitOps using a manifest, Jenkins files

## Config
- Configuration is provided in manifest.default.json
- Configuration JSON is read by Jenkinsfile_manifest
- Infrastructure Pipeline for AWS provider with RHEL VM is provided in aws_rhel_infra_pipeline
- Infrastructure Pipeline is backed by Terraform script. Parameters fed by Configuration JSON

## Limitations
- Terraform workspaces are not cleaned up