variable "region" {
  description = "Scaleway region where resources are deployed."
  type        = string
  default     = "fr-par"
}
variable "zone" {
  description = "Scaleway zone where resources are deployed."
  type        = string
  default     = "fr-par-1"
}

# Kapsule
variable "kapsule_k8s_version" {
  description = "Version of Kubernetes for blue Kapsule cluster."
  type        = string
  default     = "1.20.4"
}

variable "kapsule_green_k8s_version" {
  description = "Version of Kubernetes for green Kapsule cluster. Must not contain patch as we enable autoupgrade."
  type        = string
  default     = "1.23"
}

variable "kapsule_cni" {
  description = "Kubernetes CNI for blue Kapsule cluser."
  type        = string
  default     = "cilium"
}

variable "kapsule_node_type" {
  description = "Type of VMs to use in node pools."
  type        = string
  default     = "DEV1-M"
}

variable "kapsule_pool_size" {
  description = "Number of nodes for the main node pool of the blue Kapsule cluster."
  type        = number
  default     = 1
}

variable "kapsule_green_pool_size" {
  description = "Number of nodes for the main node pool of the green Kapsule cluster."
  type        = number
  default     = 2
}

variable "argocd_green_version" {
  description = "Version of ArgoCD Helm chart to deploy on green cluster."
  type        = string
  default     = "5.3.6"
}