# Excel to Redshift Infrastructure

This repository contains Terraform configurations to provision a complete AWS infrastructure for loading Excel files into Amazon Redshift. The setup includes:

- Networking (VPC, subnets, route tables, Internet Gateway)  
- Security (Security Groups, IAM roles/policies)  
- S3 buckets for storing Excel/CSV files  
- Amazon Redshift cluster for data warehousing  
- Terraform backend configuration and outputs  

---

## Repository Structure

excel-to-redshift-infra/
├── .github/ # GitHub workflows (optional CI/CD)
├── excel-to-redshift/ # Terraform configs
│ ├── backend.tf
│ ├── iam.tf
│ ├── internet_gateway.tf
│ ├── outputs.tf
│ ├── provider.tf
│ ├── providers.tf
│ ├── redshift.tf
│ ├── route_tables.tf
│ ├── s3.tf
│ ├── security_group.tf
│ ├── terraform.tfstate
│ ├── terraform.tfstate.backup
│ ├── variables.tf
│ └── vpc.tf
├── .gitignore # Ignore Terraform state and local files
└── README.md

yaml
Copy code

---

## Prerequisites

- Terraform v1.5+ installed  
- AWS CLI configured with valid credentials  
- AWS account with permissions to create: VPC, subnets, security groups, Internet Gateway, S3, and Redshift  
- Basic knowledge of Terraform and AWS services  

---

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/ErragotiAsha/excel-to-redshift-infra.git
cd excel-to-redshift-infra/excel-to-redshift
