# Excel to Redshift Infrastructure with CI/CD

This repository provisions AWS infrastructure for loading Excel files into Redshift, **automating deployment using GitHub Actions**.

---

## Repository Structure

excel-to-redshift-infra/
├── .github/workflows/ # GitHub Actions CI/CD for Terraform
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
├── .gitignore
└── README.md

yaml
Copy code

---

## CI/CD with GitHub Actions

This repo is configured to **automatically run Terraform** workflows:

- **Terraform Plan** on every pull request  
- **Terraform Apply** on `main` branch  

### 1. GitHub Secrets

Set the following **secrets** in your GitHub repository:

- `AWS_ACCESS_KEY_ID` → Your AWS access key  
- `AWS_SECRET_ACCESS_KEY` → Your AWS secret key  
- `AWS_REGION` → The AWS region (e.g., `us-east-1`)  

---

### 2. Sample Workflow: `.github/workflows/terraform.yml`

```yaml
name: Terraform CI/CD

on:
  push:
    branches:
      - main
  pull_request:

jobs:
  terraform:
    name: Terraform Plan & Apply
    runs-on: ubuntu-latest
    env:
      AWS_REGION: ${{ secrets.AWS_REGION }}
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v2
        with:
          terraform_version: 1.5.0

      - name: Terraform Init
        run: terraform init
        working-directory: ./excel-to-redshift

      - name: Terraform Plan
        run: terraform plan -out=tfplan
        working-directory: ./excel-to-redshift

      - name: Terraform Apply
        if: github.ref == 'refs/heads/main' && github.event_name == 'push'
        run: terraform apply -auto-approve tfplan
        working-directory: ./excel-to-redshift
