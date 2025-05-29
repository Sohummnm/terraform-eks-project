module "iam_eks_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-eks-role"

  role_name = "${var.cluster_name}-${var.environment}-eks-cluster-role"

  cluster_service_accounts = {
    "${var.cluster_name}" = ["default:my-serviceaccount-${var.environment}"]
  }
  
}
