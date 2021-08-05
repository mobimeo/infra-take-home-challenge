# Take Home Challenge

Our objective here is to understand the candidate's knowledge about Kubernetes, Helm, and Terraform. The Infrastructure and Operations Team at Mobimeo uses these tools heavily in our day-to-day work.

In [`./lib/terraform-modules`](./lib/terraform-modules) you'll find sub-directories for different components of a Kubernetes cluster - [`./lib/terraform-modules/prometheus`](./lib/terraform-modules/prometheus) and [`./lib/terraform-modules/loki`](./lib/terraform-modules/loki) for observability, [`./lib/terraform-modules/postgres`](./lib/terraform-modules/postgres) and [`./lib/terraform-modules/app`](./lib/terraform-modules/app) for some kind of simple backend service. These directories are skeleton modules that can be updated by you. There are no configurations, secrets, deployments, or even pointers to safe Docker images. This is your challenge.

You might also be wondering where the K8s cluster is. This is also your challenge!

## Tasks:

- Fork this repo and submit your results as PR from your own Github account

- Create a Kubernetes cluster with Terraform and any additional tooling/scripting of your choice or own devising. You can use any Kubernetes distro you like - minikube, kind, a Vagrantfile and some fancy `kubeadm` scripting, etc. If you want to use a public cloud, please use AWS. The objective here is to give us something we can run here at Mobimeo to review the rest of your work. And we don't have a GCP or an Azure account that we can use for this. We do have both Mac and Linux laptops.

- Fill in the `app` Terraform module to Deploy a basic application on the cluster you created. This can be a simple 'hello world' container or a vanilla 'Welcome to nginx!' server. But if you find a cool containerized app to deploy, we appreciate creativity and exploration!

- Ensure an ingress is created and that the Mobimeo engineer who reviews your implementation knows how to access it/curl it in order to see 'hello world' or 'welcome to nginx' or the echo server.

- Update [main.tf](./main.tf) and this README in the root directory. You may also need to update the providers that you find there. Make sure that the engineer reviewing your work has all the information they need to run your scripts, build your cluster, and repeat the setup you did.

## Additional Challenges
Note: These are stretch goals for a junior or mid-level engineer. A candidate for a senior engineer or staff engineer position should consider at least some of these mandatory to be considered further.

- Test your module(s) using Terratest https://terratest.gruntwork.io/
- Create a Terraform module to bootstrap a basic observability setup with Prometheus and Grafana.
- Create a Terraform module to setup basic logging with Loki.
- Replace your 'hello world' or 'welcome to nginx' app with something more complex, like a containerized sudoku webapp you may have found
- Create a Grafana dashboard that monitors your application
- Create a load-testing script for your application


## Additional Additional Challenge
- Implement the `postgres` module, a volume or two, and a CRUD app of your own devising. We use Python and Go in the infrastructure team. The company's APIs are written in Scala or Node.


## Nginx Ingress Controller 


## Overview
ingress-nginx is an Ingress controller for Kubernetes using NGINX as a reverse proxy and load balancer.



## Getting Started 


1) Setup Terraform Locally and started with building AWS EKS Cluster with Terraform
2) Updated main.tf and providers.tf with AWS EKS Module and AWS Providers ( created access key and secret key variables)
3) Optionally I have created providers.tf file locally also inside the module and exported access key and secret keys from within the module directory
4) Successfully deployed EKS Cluster on my AWS account , you can try and test to setup the cluster with this module provision-eks-cluster
5) Somehow connecting to EKS cluster endpoint with IAM user was having difficulties , need to edit the configmap.yaml file and add an IAM user to connect to the cluster
4) So decided to go with Minikube
5) Setup Minikube and helm locally
6) Added the helm repo - APP and installed the initial release
7) Modified templates files and values.yaml for the service deployment
8) deployed the service and "Welcome to Nginx" sample application working fine locally

## Success

pankajmotwani@DE-MAC-20010 app % helm install my-release app
NAME: my-release
LAST DEPLOYED: Tue Jul 27 12:33:28 2021
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=app,app.kubernetes.io/instance=my-release" -o jsonpath="{.items[0].metadata.name}")
  export CONTAINER_PORT=$(kubectl get pod --namespace default $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT

## Failure in Deploying Ingress with Helm

helm install my-release -f values.yaml .

Error: template: mobimeo/templates/ingress.yaml:40:30: executing "mobimeo/templates/ingress.yaml" at <include "app.fullname" .>: error calling include: template: mobimeo/templates/_helpers.tpl:14:14: executing "app.fullname" at <.Values.fullnameOverride>: nil pointer evaluating interface {}.fullnameOverride


## Trouleshooting

1) After creating EKS Module , were having some issues in running EKS Nodes in AWS Account , decided to go with Minikune but the issue is related to configmap.yaml file , need to add an additional user to connect to the cluster with Kubectl
due to lack of time started with Minikube

2) having multiple issues deploying Ingress using Helm charts as helpers.tpl function for app.fullname asking for fullnameOverride
values and running a new release after adding Ingress variables is throwing below errors

helm install my-release -f values.yaml .

Error: template: mobimeo/templates/ingress.yaml:40:30: executing "mobimeo/templates/ingress.yaml" at <include "app.fullname" .>: error calling include: template: mobimeo/templates/_helpers.tpl:14:14: executing "app.fullname" at <.Values.fullnameOverride>: nil pointer evaluating interface {}.fullnameOverride
## Notes and Comments 

1) Thank you Mobimeo for the opportunity and the assignment
2) Previosly worked on straight K8s deployment but never worked with helm
3) Indeed was a great learning in doing the assignment
4) Invested some time on Ingress Issue but due to 6 hours window , not going for additional Ingress trouleshooting and submitting

Thankyou






License
