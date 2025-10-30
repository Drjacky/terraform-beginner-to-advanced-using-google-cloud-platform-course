#######################################################################################

#!/bin/bash

######################################################################################

# Author        : DevOps Made Easy
# Description   : Terraform plan script with -chdir for folder context

######################################################################################

# Export Path Variable (Recommended for macOS Homebrew users)
export PATH=$PATH:/opt/homebrew/bin

######################################################################################

# Check for a path argument
if [[ -z "$1" ]]; then
echo ""
echo "You have not provided a Terraform path."
echo "SYNTAX = ./plan.sh <PATH_TO_CONFIG_FOLDER>"
echo "EXAMPLE = ./plan.sh first_project"
echo ""
exit 1
fi

######################################################################################

# 1. Initialize (using -chdir to execute command inside the target folder)
echo "Running: terraform init in $1"
terraform -chdir="$1" init || exit $?

# 2. Get Modules
echo "Running: terraform get in $1"
terraform -chdir="$1" get || exit $?

# 3. Create Execution Plan
echo "Running: terraform plan in $1"
terraform -chdir="$1" plan

######################################################################################