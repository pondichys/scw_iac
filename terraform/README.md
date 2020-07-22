# Terraform deployment code

## Create a bucket for terraform state file.

This should be the only resource created manually. Terraform can store its state file either locally or at a remote location. Working with a local state file is ok for personnal use on a single computer but if you plan to work alone but on multiple computers or if you plan to work with multiple people on the same infrastructure, the state file must be stored on a remote backend.

Terraform enables the storage of the state file on a S3 compatible storage. The Scaleway BLOB storage is a service compatible with S3.

> Caution: Scaleway BLOB storage does not offer state file locking and as such is not suitable for mutiple people to work on the same terraform deployment.

## Initialize the remote backend

To initialize the remote backend to Scaleway, follow the steps here under.

Create a provider.tf file with the following content

```hcl
provider "scaleway" {
}

terraform {
  backend "s3" {
  }
}
```

Next create a `backend.tfvars` file containing the properties of the remote backend. Use the instructions on [terraform scaleway provider's page](https://www.terraform.io/docs/providers/scaleway/index.html).

```hcl
# Configuration file for the state file backend
bucket   = "seblab-tfstate"
key      = "seblab.terraform.tfstate"
region   = "fr-par"
endpoint = "https://s3.fr-par.scw.cloud"
skip_region_validation      = true
skip_credentials_validation = true
# Both access_key and secret_key are filled in at init time with option -backend-config="access_key=xxxxxx" -backend-config="secret_key=xxxxx"
# acces_key =
# secret_key = 
```

Then initialize the backend with the following command

```bash
terraform init -backend-config="access_key=ScalewayAccessKey" -backend-config="secret_key=ScalewaySecretKey" -backend-config=backend.tfvars
```

Another option is to populate environment variables `SCW_ACCESS_KEY` and `SCW_SECRET_KEY`.

> Note: `scaleway-cli` tool (or `scw`) can be installed with `chocolatey` on Windows 10 to offer other functionalities. To install it, run `choco install scaleway-cli` in a powershell console started with administrative rights.

## Import the current BLOB bucket for Synology backup

Create an empty resource in `main.tf`

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

Now complete the definition of the resource and do a terraform plan to be sure that the existing resource will not be changed.

```hcl
resource "scaleway_object_bucket" "tf-sebpon-nas-backup" {
    name = "sebpon-nas-backup"
    acl = "private"
}
```
