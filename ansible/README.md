# Ansible deployment code

This folder contains all ansible playbooks that will be deployed on seblab.be infra on Scaleway.

## Softwares installed

The software in the list hereunder are deployed with ansible playbooks / roles.

### Base stuff

- [powerline-go](https://github.com/justjanne/powerline-go): a super nice shell command line for bash.
- [netdata](https://www.netdata.cloud/): monitoring tool.

### Development stuff for work

### My stuff for seblab.be

> Idea: investigate the option to deploy the seblab stuff on a [Kapsule](https://www.scaleway.com/fr/kubernetes-kapsule/) worker node instead.

- Docker : to rule them all.
- Traefik v2.0: reverse proxy for all docker installed applications.
- [Authelia](https://docs.authelia.com/): authentication and single sign-on for web apps.
- [Hugo](https://gohugo.io/): a static site generator for my blog.
- [Miniflux](https://miniflux.app/index.html): a RSS aggregator - to be investigated as it requires PostGresql database.

To investigate

- [Ouroboros](https://github.com/pyouroboros/ouroboros): a software to monitor and deploy new versions of Docker containers.

## Inventory

As the infrastructure is hosted on Scaleway, we'll make use of the [dynamic inventory of Scaleway](https://www.scaleway.com/en/docs/how-to-use-scaleway-ansible-modules/#-Ansible-Dynamic-Inventory-Plugin).

## Install ansible on Ubuntu 18.04

Scaleway instances use a minimized version of Ubuntu that does not contain many tools (not even sudo). First step is then to run `unminize`.

```bash
unminimize

root@tf-srv-condescending-swanson:~# unminimize
This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

This script restores content and packages that are found on a default
Ubuntu server system in order to make this system more suitable for
interactive use.

Reinstallation of packages may fail due to changes to the system
configuration, the presence of third-party packages, or for other
reasons.

This operation may take some time.

Would you like to continue? [y/N]y

Re-enabling installation of all documentation in dpkg...
Updating package list and upgrading packages...
Hit:1 http://ppa.launchpad.net/scaleway/stable/ubuntu bionic InRelease
Hit:2 http://archive.ubuntu.com/ubuntu bionic InRelease
Get:3 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:4 http://archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
Get:5 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Fetched 252 kB in 1s (202 kB/s)
Reading package lists... Done
Reading package lists... Done
Building dependency tree
Reading state information... Done
Calculating upgrade... Done
The following package was automatically installed and is no longer required:
  libdumbnet1
Use 'apt autoremove' to remove it.
The following packages will be upgraded:
  apport base-files bash bsdutils cloud-init console-setup console-setup-linux debconf distro-info-data dmeventd dmidecode
  dmsetup dpkg fdisk friendly-recovery grep grub-common grub-efi-amd64 grub-efi-amd64-bin grub2-common initramfs-tools
  initramfs-tools-bin initramfs-tools-core iputils-tracepath keyboard-configuration kmod landscape-common
  language-selector-common libblkid1 libdevmapper-event1.02.1 libdevmapper1.02.1 libfdisk1 libidn11 libkmod2 liblvm2app2.2
  liblvm2cmd2.02 libmount1 libnss-systemd libnuma1 libpam-modules libpam-modules-bin libpam-runtime libpam-systemd libpam0g
  libparted2 libplymouth4 libprocps6 libsmartcols1 libsystemd0 libudev1 libunistring2 libuuid1 libxcb1 login lvm2 lxcfs mdadm
  mount open-iscsi open-vm-tools parted passwd plymouth plymouth-theme-ubuntu-text procps python3-apport python3-debconf
  python3-distupgrade python3-gdbm python3-gi python3-httplib2 python3-problem-report python3-software-properties
  python3-update-manager snapd software-properties-common sosreport systemd systemd-sysv thermald tmux
  ubuntu-release-upgrader-core ubuntu-server ubuntu-standard udev ufw uidmap unattended-upgrades update-manager-core
  update-notifier-common ureadahead util-linux uuid-runtime xkb-data
94 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Need to get 0 B/35.6 MB of archives.
After this operation, 1,761 kB disk space will be freed.
Do you want to continue? [Y/n]y
...
```

> * You will have to reconfigure your keyboard layout.
> * When asked about the /etc/sudoer file, use the maintainer's version by answering y because otherwise you'll have to configure it manually ...

After that, run 

```bash
apt update
apt upgrade
reboot
```

```bash
apt-add-repository ppa:ansible/ansible
apt update
apt install ansible
```

Then create user seb and add it to the sudoer group.

```bash
addgroup seb sudo
```
