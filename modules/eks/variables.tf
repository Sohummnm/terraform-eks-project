variable "cluster_name" {}
variable "eks_version" {}
variable "subnet_ids" { type = list(string) }
variable "vpc_id" {}
variable "environment" {}
variable "instance_type" {}
variable "cluster_service_cidr" {}
variable "cluster_primary_sg_id" {}
