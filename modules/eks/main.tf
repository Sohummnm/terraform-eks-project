module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"
  cluster_name    = var.cluster_name
  cluster_version = var.eks_version
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids
  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}

module "eks_node_group" {
  source  = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "~> 20.31"

  cluster_name = module.eks.cluster_name
  subnet_ids   = var.subnet_ids

  name = "default"
  desired_size = 2
  min_size     = 1
  max_size     = 3
  instance_types = [var.instance_type]

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
