#!/bin/bash
set -e

# Generate the Terraform plan
terraform plan -out=tfplan.binary

# Check if the plan file exists and is not empty
if [ ! -s tfplan.binary ]; then
  echo "Error: Terraform plan file 'tfplan.binary' is empty or not created."
  exit 1
fi

# Convert the plan to JSON
terraform show -json tfplan.binary > plan.json

# Check if the JSON output is valid and not empty
if [ ! -s plan.json ]; then
  echo "Error: Terraform JSON output is empty or invalid."
  exit 1
fi

# Check for deletions in the plan
if jq -e '.resource_changes[]? | select(.change.actions | index("delete"))' plan.json > deletions.json; then
  if [ -s deletions.json ]; then
    echo "Error: Resource deletions detected in the Terraform plan. Deletion is not allowed."
    exit 1
  else
    echo "No resource deletions detected. Proceeding..."
  fi
else
  echo "No resource changes detected. Proceeding..."
fi