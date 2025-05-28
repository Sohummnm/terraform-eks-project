module "eks" {
  source = "./modules/eks"
  cluster_name = var.cluster_name
  eks_version = var.eks_version
  vpc_id = "modules/vpc/vpc_id"
  subnet_ids = "modules/vpc/private_subnets"
  node_group_subnets = "modules/vpc/private_subnets"
  environment = var.environment
} 
