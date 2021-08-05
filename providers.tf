terraform {
  required_version = ">=0.13"

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

provider "aws" {
  region     = "eu-west-1"
# Created aws profile test-kube locally , exported test-kube awsd profile and referring here to pass the aws provider creds #
# We can also pass the credentials with Environment variables, used both the method #
# profile = "test-kube"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}



#data "aws_eks_cluster" "cluster" {
  #name = module.cluster.eks_id
#}

#data "aws_eks_cluster_auth" "cluster" {
  #name = module.cluster.eks_id
#}

variable "AWS_ACCESS_KEY_ID" {
  type      = string
  sensitive = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type      = string
  sensitive = true
}



provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}
