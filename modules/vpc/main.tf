data "aws_availability_zones" "available" {
  state = "available" 
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  cidr = var.cidr_block
  cluster_name = "my-${var.environment}-vpc"

  azs             = [data.aws_availability_zones.available.names[0]]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Terraform = "true"
    Environment = "${var.environment}"
  }
}
