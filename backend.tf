terraform {
  backend "s3" {
    bucket = "sohumnm.k8s.local"
    key = "envs/dev/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-locks"
}
}
