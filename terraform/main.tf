# This file contains the terraform provider used for Scaleway
provider "scaleway" {
}

terraform {
  backend "s3" {
  }
}
