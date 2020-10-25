#!/usr/bin/env groovy

// generate tfvars content
def create_tfvars(String ansible_user, int inst_count, String private_key) {
    echo "ansible_user = \"${ansible_user}\""
    +"\nrhel_inst_count = \"${inst_count}\""
    +"\nprivate_key = \"${private_key}\""
}