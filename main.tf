provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr
  environment = var.environment
  cluster_name = var.cluster_name
}

module "iam" {
  source = "./modules/iam"
  cluster_name = var.cluster_name
  environment = var.environment
  depends_on = [module.eks]
}

module "eks" {
  source = "./modules/eks"
  cluster_name = var.cluster_name
  vpc_id = module.vpc.vpc_id
  eks_version = var.eks_version
  subnet_ids = module.vpc.private_subnets
  environment = var.environment
  instance_type   = var.instance_type
  cluster_service_cidr = "172.20.0.0/16"
  cluster_primary_sg_id = module.eks.cluster_primary_security_group_id
  
}

module "eks_node_group" {
  source = "./modules/eks-node-group"

  cluster_name    = var.cluster_name
  subnet_ids      = module.vpc.private_subnets
  instance_type   = var.instance_type
  environment     = var.environment
  vpc_id = module.vpc.vpc_id
  eks_version = var.eks_version
}
