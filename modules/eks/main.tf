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
