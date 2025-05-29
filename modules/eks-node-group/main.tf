module "eks_node_group" {
  source  = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "~> 20.31"

  cluster_name = var.cluster_name
  subnet_ids   = var.subnet_ids

  name = "default"
  desired_size = 2
  min_size     = 1
  max_size     = 3
  instance_types = [var.instance_type]
  cluster_service_ipv4_cidr     = var.cluster_service_cidr
  cluster_primary_security_group_id = var.cluster_primary_sg_id

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
