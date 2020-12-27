variable "region" {
  default = "fr-par"
}
variable "zone" {
  default = "fr-par-1"
}

# Kapsule
variable "kapsule_k8s_version" {
  default = "1.20"
}

variable "kapsule_cni" {
    default = "cilium"
}

variable "kapsule_node_type" {
  default = "DEV1-M"
}
variable "kapsule_pool_size" {
  default = 1
}
variable "kapsule_ingress" {
  default = "nginx"
}