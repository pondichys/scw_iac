# restic backups

This document describes how to setup restic backups to Scaleway object storage.

Install `restic`

```bash
sudo apt install restic
```

Initialize the repository

```bash
export AWS_ACCESS_KEY_ID=<Scaleway access token>
export AWS_SECRET_ACCESS_KEY=<Scaleway secret token>
export AWS_DEFAULT_REGION=fr-par

restic -r s3:https://s3.fr-par.scw.cloud/seblab-restic-backup init
```
