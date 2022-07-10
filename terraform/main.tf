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
  }
  required_version = ">= 1.0.0"
}

provider "scaleway" {
  zone = "fr-par-1"
}
