#######################################################################################

#!/bin/bash

######################################################################################

# Author        : DevOps Made Easy
# Email         : devopsmadeeasy@gmail.com
# Description   : Terraform destroy script
# Documentation : https://www.terraform.io/docs/commands/destroy.html

######################################################################################

# Export Path Variable (Use quotes around the path to handle spaces if they exist)
export PATH="$PATH:/opt/homebrew/bin"

######################################################################################

# If statement to ensure a user has provided a Terraform folder path
if [[ -z "$1" ]]; then
echo ""
echo "You have not provided a Terraform path."
echo "SYNTAX = ./destroy.sh <PATH_TO_CONFIG_FOLDER>"
echo "EXAMPLE = ./destroy.sh first_project"
echo ""
exit 1 # Use exit 1 for a failure
fi

######################################################################################

# Use -chdir="$1" to execute commands inside the target folder.

# 1. Initialize the working directory
echo "Running: terraform init in $1"
terraform -chdir="$1" init || exit $?

# 2. Download and update modules
echo "Running: terraform get in $1"
terraform -chdir="$1" get || exit $?

# 3. Destroy the infrastructure (The -auto-approve flag is safe here)
echo "Running: terraform destroy in $1"
terraform -chdir="$1" destroy -auto-approve

######################################################################################