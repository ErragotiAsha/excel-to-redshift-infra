terraform {
  required_version = ">= 1.6"

  backend "s3" {
    bucket         = "tfstate-034362041286-ap-south-1"
    key            = "excel-to-redshift/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf-locks"
    encrypt        = true
  }
}
