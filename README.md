# Scaleway Infrastructure as Code for seblab.be

# This repository is obsolete and archived

This repository contains the code to deploy my infrastructure hosted on Scaleway cloud. It consists of Terraform and Ansible code.

## Prerequisites

Create a Scaleway account.

Login to the Scaleway console. Edit your account's profile and go to **Credentials** tab.

Note your **organization ID**.

Create a new API tokens for terraform to access your Scaleway resources. Note the access and secret keys and keep them in a safe place (a password vault like [Bitwarden](https://bitwarden.com) or Keepass is nice for this).

> Important: this will be the only time the secret will be displayed. If you loose it, you'll have to create a new key.

Create a Scaleway configuration file by following the instructions [here](https://github.com/scaleway/scaleway-sdk-go/blob/master/scw/README.md#scaleway-config). It will create a configuration file that will be usable by all Scaleway tools. This file will contain data for terraform to access Scaleway resources.

## Scaleway CLI

Scaleway offers a nice command line interface that can be used to manage your resources. You can find the source code and instructions in [Scaleway CLI Github](https://github.com/scaleway/scaleway-cli).

To install the CLI on Windows 10, the fastest way is to use [chocolatey](https://chocolatey.org/) package manager. Open a `Powershell` prompt in elevated mode (run as administrator) and run the following command.

```powershell
    choco install scaleway-cli
```

To update the CLI

```powershell
    choco update scaleway-cli
```
