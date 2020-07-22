# This file contains all compute resource

# First we create a security group
resource "scaleway_instance_security_group" "def-sg" {
  name                   = "seblab-sg"
  description            = "Security group for seblab.be infra"
  inbound_default_policy = "drop" # By default we drop incomming trafic that do not match any inbound_rule

  inbound_rule { # Accept only SSH trafic from my IP
    action = "accept"
    port   = 22
    ip     = "109.88.57.95"
  }

  inbound_rule {
    action = "accept" # Accept https from anywhere
    port   = 443
  }
}

# Then we create a public IP
resource "scaleway_instance_ip" "server_ip" {}

# We create a VM and assign it to the security group
resource "scaleway_instance_server" "seblab" {
  type              = "DEV1-M"
  image             = "ubuntu-bionic"
  tags              = ["seblab"]
  ip_id             = scaleway_instance_ip.server_ip.id
  security_group_id = scaleway_instance_security_group.def-sg.id
}