#!/bin/bash
set -e

# Generate the Terraform plan
terraform plan -out=tfplan.binary

# Check for deletions in the plan
if terraform show -json tfplan.binary | jq -e '.resource_changes[]? | select(.change.actions | index("delete"))' > deletions.json; then
  if [ -s deletions.json ]; then
    echo "Error: Resource deletions detected in the Terraform plan. Deletion is not allowed."
    exit 1
  else
    echo "No resource deletions detected. Proceeding..."
  fi
else
  echo "Error: Failed to parse Terraform plan JSON."
  exit 1
fi