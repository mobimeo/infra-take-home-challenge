terraform {
  required_version = ">= 1.0"
  required_providers {
    kind = {
      source  = "kyma-incubator/kind"
      version = "0.0.11"
    }
  }
}
