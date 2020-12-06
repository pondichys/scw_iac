# This file contains the terraform provider used for Scaleway
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "seblab"

    workspaces {
      name = "scw_iac"
    }
  }

  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
}

provider "scaleway" {
  zone = "fr-par-1"
}
