terraform {
  required_version = "= 1.0"

  required_providers {
    aws = {
      version = "3.45.0"
    }
    kubernetes = {
      version = "2.1.0"
    }
    helm = {
      version = "2.1.2"
    }
  }

  #backend "s3" {
    #region         = "eu-central-1"
    #bucket         = "mobimeo-app-terraform-state"
    #key            = "terraform.tfstate"
  #}
}

#provider "aws" {
  #region = "eu-central-1"
#}

#data "aws_eks_cluster" "cluster" {
  #name = module.cluster.eks_id
#}

#data "aws_eks_cluster_auth" "cluster" {
  #name = module.cluster.eks_id
#}

#provider "kubernetes" {
  #host                   = data.aws_eks_cluster.cluster.endpoint
  #cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  #token                  = data.aws_eks_cluster_auth.cluster.token
#}

#provider "helm" {
  #kubernetes {
    #host                   = data.aws_eks_cluster.cluster.endpoint
    #cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    #token                  = data.aws_eks_cluster_auth.cluster.token
  #}
#}
