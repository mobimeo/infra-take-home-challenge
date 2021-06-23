# take-home-challenge

Our here objective is to access the candidate's Knowledge about Kubernetes and Terraform.

## tasks:
- Create a Terraform module to Deploy a basic application on the cluster.
- Create a Terraform module to create a RDS Postgres database on AWS. This module should be usable by developers. 
  Therefore, It should contain sensible presets and documentation so they can use the module easily.

## nice to see:
- You tested your modules using Terratest https://terratest.gruntwork.io/
- Create a Terraform module to bootstrap a basic monitoring with Prometheus and Grafana.
- Create a Terraform module to setup basic logging with Loki.

## extra
- You create your basic application (e.g Go, Python or Java).

## notes:
- Your application should connect to a Postgres database to perform simple CRUD operations (GET, POST, DELETE) on a table.

## todo:
- Bootstrap EKS environment for candidates, so they can run terraform and deploy.
  We would need this new enviroment to have EKS module with `cluster_endpoint_public_access = true`
- Create IAM User for candidate
- Can we have action runners so that the candidate can write a workflow?

## notes:
- Environment should be only big enougth for stuff like Prometheus and Loki
