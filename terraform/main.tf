# This file contains the terraform provider used for Scaleway
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "seblab"

    workspaces {
      name = "scw_iac"
    }
  }

  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~>2.2.2"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.6.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "scaleway" {
  zone = "fr-par-1"
}

provider "helm" {
  kubernetes {
    host  = null_resource.kubeconfig_green.triggers.host
    token = null_resource.kubeconfig_green.triggers.token
    cluster_ca_certificate = base64decode(
      null_resource.kubeconfig_green.triggers.cluster_ca_certificate
    )
  }
  alias = "green"
}