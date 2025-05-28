module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  environment = var.environment
  cidr = "10.0.0.0/16"
  name = "my-${var.environment}-vpc

  azs             = ["eu-west-1a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.2.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "${var.environment}"
  }
}
