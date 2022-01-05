# Take Home Challenge

K8s cluster on AWS EKS. Configure your AWS CLI before proceeding. Default reguion is `eu-central-1`. https://github.com/paulbouwer/hello-kubernetes is the image deployed.

Development environment;

- `aws` CLI version;

```
aws --version
aws-cli/2.3.6 Python/3.8.8 Linux/5.11.3-gentoo-x86_64 exe/x86_64.gentoo.2 prompt/off
```

- `terraform` CLI version;

```
Terraform v1.0.10
on linux_amd64
+ provider registry.terraform.io/hashicorp/aws v3.70.0
+ provider registry.terraform.io/hashicorp/cloudinit v2.2.0
+ provider registry.terraform.io/hashicorp/helm v2.4.1
+ provider registry.terraform.io/hashicorp/kubernetes v2.7.1
+ provider registry.terraform.io/hashicorp/local v2.1.0
+ provider registry.terraform.io/terraform-aws-modules/http v2.4.1
```

If terraform timeouts while deploying the `app` module, `app` can be deployed via `kubectl`; `KUBECONFIG=./kubeconfig_mobimeo-infra-the-kubernetes kubectl apply -n app -f ./lib/terraform-modules/app/helm/values.yaml`. For the Ingress, `KUBECONFIG=./kubeconfig_mobimeo-infra-the-kubernetes kubectl apply -n app -f ./lib/terraform-modules/app/helm/service.yaml`.

To see the `hello-kubernetes` page, run `KUBECONFIG=./kubeconfig_mobimeo-infra-the-kubernetes kubectl describe -n app service hello-kubernetes-lb` and get the web address for the ingress. Entering it to webpage will display the welcome page.

To destroy all the created resource, please run `terraform destroy`. If `app` is created via `kubectl`, remove them via `delete` command (substitute `apply` with `delete` for the commands listed above).



## Tasks:

- [X] Fork this repo and submit your results as PR from your own Github account

- [X] Create a Kubernetes cluster with Terraform and any additional tooling/scripting of your choice or own devising. You can use any Kubernetes distro you like - minikube, kind, a Vagrantfile and some fancy `kubeadm` scripting, etc. If you want to use a public cloud, please use AWS. The objective here is to give us something we can run here at Mobimeo to review the rest of your work. And we don't have a GCP or an Azure account that we can use for this. We do have both Mac and Linux laptops.

- [X] Fill in the `app` Terraform module to Deploy a basic application on the cluster you created. This can be a simple 'hello world' container or a vanilla 'Welcome to nginx!' server. But if you find a cool containerized app to deploy, we appreciate creativity and exploration!

- [X] Ensure an ingress is created and that the Mobimeo engineer who reviews your implementation knows how to access it/curl it in order to see 'hello world' or 'welcome to nginx' or the echo server.

- [X] Update [main.tf](./main.tf) and this README in the root directory. You may also need to update the providers that you find there. Make sure that the engineer reviewing your work has all the information they need to run your scripts, build your cluster, and repeat the setup you did.

## Additional Challenges
Note: These are stretch goals for a junior or mid-level engineer. A candidate for a senior engineer or staff engineer position should consider at least some of these mandatory to be considered further.

- [X] Test your module(s) using Terratest https://terratest.gruntwork.io/

Run the test with `go run -v` and got `No changes. Your infrastructure matches the configuration.` and `Apply complete! Resources: 0 added, 0 changed, 0 destroyed.` outputs.

- [ ] Create a Terraform module to bootstrap a basic observability setup with Prometheus and Grafana.
- [X] Create a Terraform module to setup basic logging with Loki.
- [ ] Replace your 'hello world' or 'welcome to nginx' app with something more complex, like a containerized sudoku webapp you may have found
- [ ] Create a Grafana dashboard that monitors your application
- [ ] Create a load-testing script for your application


## Additional Additional Challenge
- [ ] Implement the `postgres` module, a volume or two, and a CRUD app of your own devising. We use Python and Go in the infrastructure team. The company's APIs are written in Scala or Node.
