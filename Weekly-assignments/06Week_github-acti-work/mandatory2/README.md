# Terraform Azure Infrastructure Provisioning

## Table of Contents
1. [Introduction](#introduction)
2. [Purpose of Each Module](#purpose-of-each-module)
3. [How to Use the Terraform Scripts](#how-to-use-the-terraform-scripts)
4. [Prerequisites and Dependencies](#prerequisites-and-dependencies)
5. [Explanation of Variables in vars.tfvars](#explanation-of-variables-in-varstfvars)

---

## Introduction
Welcome to the Terraform Azure Infrastructure Provisioning project! This project is designed to facilitate the provisioning and management of various Azure resources using Terraform modules. Its primary purpose is to create a reusable foundation for deploying similar infrastructure for multiple clients in the future.

This README will provide you with essential information on how to understand and utilize this Terraform project effectively.

---

## Purpose of Each Module
This section describes the purpose and functionality of each Terraform module included in this project. Modules are designed to be reusable components that simplify the process of provisioning Azure resources. Below is an overview of the modules you'll find in this project:

### 1. `network` Module
**Purpose**: This module is responsible for creating Virtual Networks (VNETs) in Azure. It allows you to define network configurations, subnets, and associated resources.

### 2. `vm` Module
**Purpose**: The VM (Virtual Machine) module is designed to create and configure virtual machines in Azure. It includes options for customizing VM sizes, operating systems, and networking settings.

### 3. `storage` Module
**Purpose**: The Storage Account module helps you create Azure Storage Accounts and their related containers. It supports different storage types, access configurations, and replication options.

### 4. `key_vault` Module
**Purpose**: This module enables the provisioning of Azure Key Vaults, which are used for securely storing and managing sensitive data such as secrets and certificates for VMs and storage accounts. 

---

## How to Use the Terraform Scripts
This section provides step-by-step instructions on how to use the Terraform scripts to deploy Azure infrastructure using this project. Make sure you have the necessary prerequisites (covered in the next section) in place before proceeding.

**Step 1: Clone the Repository**
- Clone this Git repository to your local machine using the following command, then enter the downloaded folder using the cd command:
  ```
  git clone <repository-url>
  cd folder_name
  ```

**Step 2: Configure Azure Authentication**
-  Sign in to your Azure Tenant using your account or a Service Principal using Azure CLI.
   ```
   az login --service-principal --username username_here --password password_here --tenant tenant_id_here
   ```

**Step 3: Customize the Configuration**
- Navigate to the project directory and modify the `vars.tfvars` file to customize the configurations based on your requirements. See [Explanation of Variables in vars.tfvars](#explanation-of-variables-in-varstfvars) for more information. 

**Step 4: Initialize Terraform**
- Run the following command to initialize Terraform in the project directory:
  ```
  terraform init
  ```

**Step 5: Plan the Deployment**
- Generate an execution plan to preview the changes that Terraform will make:
  ```
  terraform plan -var-file="vars.tfvars"
  ```

**Step 6: Apply the Configuration**
- Apply the Terraform configuration to create Azure resources:
  ```
  terraform apply -var-file="vars.tfvars"
  ```

**Step 7: Destroy Resources (Optional)**
- If needed, you can destroy the resources created using Terraform:
  ```
  terraform destroy -var-file="vars.tfvars"
  ```

---

## Prerequisites and Dependencies
Before you begin using this Terraform project, make sure you have the following prerequisites and dependencies in place:

- **Azure Subscription**: You must have an active Azure subscription to deploy resources.
- **Terraform**: Ensure that Terraform is installed on your local machine. You can download it from the [official website](https://www.terraform.io/downloads.html).
- **Azure CLI**: Azure CLI should be installed and configured with appropriate access to your Azure subscription.
- **Git**: You need Git installed to clone this repository and manage your Terraform project.



## Explanation of Variables in vars.tfvars

Below is a general explanation of the variables used in the vars.tfvars file. Customize them to fit your environment.

### General Configuration Variables

#### `org_identifier`
- **Type**: String
- **Description**: Organization Identifier, used for naming resources. 
- **Example Value**: `"ot"`

#### `resource_group_name`
- **Type**: String
- **Description**: The name of the Azure resource group where resources will be provisioned.
- **Example Value**: `"rg-08-01"`

#### `location`
- **Type**: String
- **Description**: The Azure region where resources will be deployed.
- **Example Value**: `"westeurope"`

#### `common_tags`
- **Type**: Map
- **Description**: Tags to be applied to all resources for better management and filtering.
- **Example Value**: `{ "Environment" = "Dev" }`

---

### Networking Variables

#### `vnet_name`
- **Type**: String
- **Description**: The name of the Azure virtual network.
- **Example Value**: `"vnet-08-01"`

#### `subnet_name`
- **Type**: String
- **Description**: The name of the subnet within the virtual network.
- **Example Value**: `"sub-08-01"`

#### `nsg_name`
- **Type**: String
- **Description**: The name of the Network Security Group associated with the subnet.
- **Example Value**: `"nsg-08-01"`

#### `allowed_ip`
- **Type**: String
- **Description**: The IP address that is allowed to access resources within the network.
- **Example Value**: `"158.248.1.237"`

---

### Storage Configuration Variables

#### `storage_account_name`
- **Type**: String
- **Description**: The name of the Azure storage account.
- **Example Value**: `"strac02552245"`

#### `storage_account_tier`
- **Type**: String
- **Description**: The performance tier of the storage account.
- **Example Value**: `"Standard"`

#### `storage_account_replication_type`
- **Type**: String
- **Description**: The type of replication to use for the storage account.
- **Example Value**: `"LRS"`

#### `storage_container_name`
- **Type**: String
- **Description**: The name of the container within the storage account.
- **Example Value**: `"mystoragcont24322"`

---

### Virtual Machine Configuration Variables

#### `vm_name`
- **Type**: String
- **Description**: The name of the Virtual Machine.
- **Example Value**: `"MyVM"`

#### `vm_size`
- **Type**: String
- **Description**: The size or type of the Virtual Machine.
- **Example Value**: `"Standard_DS1_v2"`

#### `admin_username`
- **Type**: String
- **Description**: The username for the admin account on the Virtual Machine.
- **Example Value**: `"ntnuadmin"`

#### `vm_publisher`
- **Type**: String
- **Description**: Company creating the virtual machine image.
- **Example Value**: `"Canonical"`

#### `vm_offer`
- **Type**: String
- **Description**: Custom configuration or script used during the provisioning of Ubuntu Server virtual machines on Azure.
- **Example Value**: `"0001-com-ubuntu-server-focal"`

#### `vm_sku`
- **Type**: String
- **Description**: Image used to create the virtual machine.
- **Example Value**: `"20_04-lts"`

#### `vm_version`
- **Type**: String
- **Description**: Version used for the virtual machine image.
- **Example Value**: `latest`

---

### Key Vault Configuration Variables

#### `key_vault_name`
- **Type**: String
- **Description**: The name of the Azure Key Vault instance.
- **Example Value**: `"kevaultntnu55test"`

#### `key_vault_sku`
- **Type**: String
- **Description**: The SKU or the pricing tier of the Key Vault.
- **Example Value**: `"standard"`






---
