module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"
  cluster_name    = var.cluster_name
  cluster_version = var.eks_version
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids
  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity = 3
      min_capacity = 1
      instance_types = ["${var.instance_type}"]
}
}
  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
