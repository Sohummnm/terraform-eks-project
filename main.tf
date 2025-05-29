provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr
  environment = var.environment
}

module "iam" {
  source = "./modules/iam"
  cluster_name = var.cluster_name
  environment = var.environment
}

module "eks" {
  source = "./modules/eks"
  cluster_name = var.cluster_name
  vpc_id = module.vpc.vpc_id
  eks_version = var.eks_version
  subnet_ids = module.vpc.private_subnets
  environment = var.environment
  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_types   = [var.instance_type]
    }
  }
}
