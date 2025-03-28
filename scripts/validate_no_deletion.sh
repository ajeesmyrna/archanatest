#!/bin/bash
# Validate that no resource deletions are present in the Terraform plan

terraform plan -out=tfplan.binary
terraform show -json tfplan.binary | jq -e '.resource_changes[]? | select(.change.actions | index("delete"))' > deletions.json

if [ -s deletions.json ]; then
  echo "Error: Resource deletions detected in the Terraform plan. Deletion is not allowed."
  exit 1
else
  echo "No resource deletions detected. Proceeding..."
fi