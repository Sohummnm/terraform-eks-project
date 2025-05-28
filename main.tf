provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key = "envs/${var.environment}/terraform.tfstate"
    region = var.region
    dynamodb_table = "terraform-locks"
}
}

module
