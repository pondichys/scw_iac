# Configuration file for the state file backend
bucket                      = "seblab-tfstate"
key                         = "seblab.terraform.tfstate"
region                      = "fr-par"
endpoint                    = "https://s3.fr-par.scw.cloud"
skip_region_validation      = true
skip_credentials_validation = true
# Both access_key and secret_key are filled in at init time with option -backend-config="access_key=xxxxxx" -backend-config="secret_key=xxxxx"
# acces_key =
# secret_key = 