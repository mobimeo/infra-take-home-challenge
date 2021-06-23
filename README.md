# take-home-challenge

Our here objective is to access the candidate's Knowledge about Kubernetes and Terraform.

- Create a Terraform module to Deploy a basic application on the cluster.
- Create a Terraform module to create a RDS Postgres database on AWS. This module should be usable by developers. 
  Therefore, It should contain sensible presets and documentation so they can use the module easily.

Bonus #1: You tested your modules using Terratest https://terratest.gruntwork.io/
Bonus #2: Create a Terraform module to bootstrap a basic monitoring with Prometheus and Grafana.
Bonus #3: Create a Terraform module to setup basic logging with Loki.
Bonus #4: You created a GitHub Workflow for your application.
Bonus #5: You create your basic application (e.g Go, Python or Java).

## Notes:
- Your application should connect to a Postgres database to perform simple CRUD operations (GET, POST, DELETE) on a table.

# todo

- Bootstrap EKS environment for candidates, so they can run terraform and deploy.
- IAM User for candidate
- Environment should be big enought to host Prometheus and Loki
