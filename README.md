# Archanaprod

**Archanaprod** is a Terraform project designed to simulate a production environment using modularized infrastructure as code (IaC). The project leverages reusable modules to create and manage Azure resources such as resource groups, virtual networks, subnets, and virtual machines.

---

## Project Structure

The project is organized into the following modules:

### 1. **Resource Group Module**
- **Purpose**: Creates Azure resource groups for organizing resources.
- **Inputs**:
  - `resource_group_name`: Name of the resource group.
  - `location`: Azure region where the resource group will be created.
- **Outputs**:
  - `resource_group_name`: The name of the created resource group.
  - `resource_group_location`: The location of the created resource group.

### 2. **Virtual Network and Subnets Module**
- **Purpose**: Creates a virtual network and associated subnets.
- **Inputs**:
  - `name`: Name of the virtual network.
  - `location`: Azure region where the virtual network will be created.
  - `resource_group_name`: Name of the resource group where the virtual network will reside.
  - `address_space`: Address space for the virtual network.
  - `subnets`: Map of subnets to create, including names and address prefixes.
- **Outputs**:
  - `vnet_name`: The name of the virtual network.
  - `subnet_ids`: Map of subnet names to their IDs.

### 3. **Virtual Machine Module**
- **Purpose**: Creates Azure virtual machines with optional public IPs.
- **Inputs**:
  - `vm_name`: Name of the virtual machine.
  - `location`: Azure region where the VM will be created.
  - `resource_group_name`: Name of the resource group where the VM will reside.
  - `subnet_id`: ID of the subnet where the VM will be deployed.
  - `vm_size`: Size of the virtual machine (e.g., `Standard_B2s`).
  - `admin_username`: Admin username for the VM.
  - `admin_password`: Admin password for the VM.
  - `create_public_ip`: Whether to create a public IP for the VM.
- **Outputs**:
  - `vm_id`: The ID of the virtual machine.
  - `vm_name`: The name of the virtual machine.
  - `vm_private_ip`: The private IP address of the virtual machine.
---
----
## Usage

### Prerequisites
1. Install [Terraform](https://www.terraform.io/downloads.html).
2. Authenticate with Azure using the Azure CLI:
   ```bash
   az login

### Steps to Deploy
1. Clone the repository:
   ```bash
   git clone https://github.com/ajeesmyrna/archanaprod.git
   cd archanaprod
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Validate the configuration:
   ```bash
   terraform validate
   ```

4. Plan the deployment:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply -auto-approve
   ```
----
----
## Inputs

### Root Module Variables
| Variable Name       | Description                                      | Type   
|---------------------|--------------------------------------------------|--------||
| `vnet_name`         | Name of the virtual network                     | string 
| `address_space`     | Address space for the virtual network            | list   
| `subnets`           | Map of subnets to create                        | map    
| `admin_username`    | Admin username for the virtual machines          | string 
| `admin_password`    | Admin password for the virtual machines          | string 
| `create_public_ip`  | Whether to create a public IP for the VMs        | bool   


## Outputs

### Root Module Outputs
| Output Name         | Description                                      |
|---------------------|--------------------------------------------------|
| `prod_vm_id`        | The ID of the first production virtual machine   |
| `prod_vm_name`      | The name of the first production virtual machine |
| `prod_vm_private_ip`| The private IP of the first production VM        |
| `subnet_ids`        | Map of subnet names to their IDs                 |

---

## Repository Structure

```plaintext
archanaprod/
├── main.tf                # Root module configuration
├── variables.tf           # Input variables for the root module
├── outputs.tf             # Outputs for the root module
├── terraform.tfvars       # Default variable values
├── modules/
│   ├── resourcegrp/       # Module for creating resource groups
│   ├── vnetandsubnets/    # Module for creating virtual networks and subnets
│   ├── virtualmachine/    # Module for creating virtual machines
└── README.md              # Project documenation
'''
---
---
## Example `terraform.tfvars`

---

```hcl
vnet_name = "archanaprod-vnet"

address_space = [""]

subnets = {
  prod = {
    name            = ""
    address_prefixes = [""]
  }
  nonprod = {
    name            = ""
    address_prefixes = [""]
  }
}

admin_username = ""
admin_password = ""
create_public_ip = false
```

---

## Notes

- Ensure that the Azure CLI is authenticated before running Terraform commands.
- Update the `terraform.tfvars` file to customize the deployment for your environment.
- The project is modular and can be extended to include additional Azure resources.

## GitHub Actions
This project includes a GitHub Actions workflow to automate Terraform operations such as init, plan, and apply.

### Workflow File
The GitHub Actions workflow file is located at .github/workflows/terraform.yml.

### Key Features

- Automatically runs on every push to the main branch.
- Validates, plans, and optionally applies Terraform configurations.
- Uses a GitHub Personal Access Token (PAT) or SSH for accessing private repositories.

## Example Workflow
#### name: Terraform Workflow
---

```hcl

on:
  push:
    branches:
      - main

jobs:
  terraform:
    runs-on: ubuntu-latest

    steps:
      # Step 1: Checkout the repository
      - name: Checkout code
        uses: actions/checkout@v3

      # Step 2: Configure Git credentials
      - name: Configure Git credentials
        run: |
          git config --global url."https://$GITHUB_TOKEN@github.com/".insteadOf "https://github.com/"
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

      # Step 3: Initialize Terraform
      - name: Terraform Init
        run: terraform init

      # Step 4: Validate Terraform
      - name: Terraform Validate
        run: terraform validate

      # Step 5: Plan Terraform
      - name: Terraform Plan
        run: terraform plan

      # Step 6: Apply Terraform (optional)
      - name: Terraform Apply
        if: github.event_name == 'push'
        run: terraform apply -auto-approve
'''
---