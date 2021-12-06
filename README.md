# Take Home Challenge

## How to deploy

### Requirements

Make sure you have [Docker](https://docs.docker.com/get-docker/) and [Terraform](https://www.terraform.io/downloads.html) in your local environment

### Deploy

Use terraform to deploy the application:

```bash
terraform apply
```

## Accessing the application

The app is deployed in a KIND cluster, in order to access it, you can use the url http://localhost/app

## Monitoring

### Grafana

After deploy, Grafana can be accessed on http://localhost/grafana .

There's an application dashboard with some basic metrics (Dashboard name: App monitoring)

## Logging

Application logs are being sent to Loki, you can use [Grafana explore mode](http://localhost/grafana/explore?orgId=1&left=%5B%22now-1h%22,%22now%22,%22loki%22,%7B%22expr%22:%22%22,%22refId%22:%22A%22,%22range%22:true%7D%5D) to visualize the logs.

