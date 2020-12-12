# Terraform deployment code

This page explains the `Terraform` setup of my IaC on Scaleway cloud.

## Terraform source code

All the infrastructure deployed at Scaleway Elements is described in `Terraform` files that are stored in the [terraform](https://github.com/pondichys/scw_iac/tree/master/terraform) folder of this Github repository.

This repository is linked to a Terraform Cloud workspace that executes terraform plan and terraform apply command when a commit is issued on file(s) in the terraform folder.

## Terraform Cloud

I do now use [Terraform Cloud](https://app.terraform.io) to automate the deployment of the infrastructure. Terraform Cloud not only runs the command but also stores the state file and eliminates the need to deploy and configure a BLOB storage bucket.

Originally I was running Terraform on my local workstation with the state file stored in a Scaleway BLOB storage bucket.

## Import the current BLOB bucket for Synology backup

Below are the initial instructions I had to run to import an existing Scaleway BLOB storage bucket used to store the backups of my NAS.

Create an empty resource in `scw-blob.tf`.

```hcl
resource "scaleway_object_bucket" "tf-sebpon-nas-backup" {

}
```

Then import the definition of the bucket in the state file with the following command

```hcl
terraform import scaleway_object_bucket.tf-sebpon-nas-backup fr-par/sebpon-nas-backup

scaleway_object_bucket.tf-sebpon-nas-backup: Importing from ID "fr-par/sebpon-nas-backup"...
scaleway_object_bucket.tf-sebpon-nas-backup: Import prepared!
  Prepared scaleway_object_bucket for import
scaleway_object_bucket.tf-sebpon-nas-backup: Refreshing state... [id=fr-par/sebpon-nas-backup]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```

Now complete the definition of the resource and do a `terraform plan` to be sure that the existing resource will not be changed.

```hcl
resource "scaleway_object_bucket" "tf-sebpon-nas-backup" {
    name = "sebpon-nas-backup"
    acl = "private"
}
```
