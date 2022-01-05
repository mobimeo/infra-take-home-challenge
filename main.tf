module "app" {
  source            = "./lib/terraform-modules/app"
  namespace         = "app"
}

module "loki" {
  source            = "./lib/terraform-modules/loki"
  namespace         = "logging"
}

locals {
  cluster_name = "mobimeo-infra-the-kubernetes"
}

data "aws_availability_zones" "available" {
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.0"  

  name                 = "mobimeo-the-vpc"
  cidr                 = "172.31.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = ["172.31.1.0/24", "172.31.2.0/24", "172.31.3.0/24"]
  public_subnets       = ["172.31.4.0/24", "172.31.5.0/24", "172.31.6.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.24.0"

  cluster_name    = "${local.cluster_name}"
  subnets         = module.vpc.private_subnets

  vpc_id = module.vpc.vpc_id

  node_groups = {
    first = {
      desired_capacity = 1
      max_capacity     = 5
      min_capacity     = 1

      instance_type = "t2.micro"
    }
  }
  
  write_kubeconfig   = true
  kubeconfig_output_path = "./"
}
