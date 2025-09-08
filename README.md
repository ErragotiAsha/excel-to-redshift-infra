# Excel to Redshift Infrastructure

This repository contains the Terraform configuration to provision the infrastructure required for migrating and managing Excel data in AWS Redshift. The setup is modular, using Terraform modules for networking, S3 storage, IAM roles, and Redshift, and integrates CI/CD workflows with GitHub Actions.

---

## ✅ **Features**

- **Modular architecture** with separate modules for networking, S3, IAM, and Redshift.
- **Reusable Terraform code** using modules.
- **State management** with Terraform backend configuration.
- **CI/CD pipeline** configured using GitHub Actions for automated validation and deployment.
- **Outputs exposed** for easy access to resource identifiers like VPC ID, S3 bucket name, and Redshift endpoint.

---

## 📂 **Repository Structure**

excel-to-redshift-infra/
├── .github/
│ └── workflows/
│ └── terraform.yml # CI/CD pipeline for Terraform
├── modules/
│ ├── networking/
│ │ ├── vpc.tf
│ │ ├── internet_gateway.tf
│ │ ├── route_tables.tf
│ │ ├── security_group.tf
│ │ └── networking_outputs.tf
│ ├── s3/
│ │ ├── s3.tf
│ │ └── s3_outputs.tf (optional)
│ ├── redshift/
│ │ ├── redshift.tf
│ │ └── redshift_outputs.tf (optional)
│ └── iam/
│ ├── iam.tf
│ └── iam_outputs.tf (optional)
├── excel-to-redshift/
│ ├── backend.tf # Terraform backend config
│ ├── provider.tf # AWS provider configuration
│ ├── providers.tf # Additional provider setups
│ ├── variables.tf # Input variables
│ ├── terraform.tfstate # Terraform state file
│ └── terraform.tfstate.backup # Terraform backup state
├── .gitignore
└── README.md # This file


## 🚀 **Setup Instructions**

### Prerequisites

- [Terraform](https://www.terraform.io/downloads) installed.
- AWS CLI configured with appropriate permissions.
- GitHub repository set up with access to GitHub Actions.

---

### ✅ **Steps to Deploy**

1. **Clone the repository**
   ```bash
   git clone https://github.com/ErragotiAsha/excel-to-redshift-infra.git
   cd excel-to-redshift-infra-auto-approve tfplan
        working-directory: ./excel-to-redshift
