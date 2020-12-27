# All info available at https://developers.scaleway.com/en/products/k8s/api/#introduction

resource "scaleway_k8s_cluster_beta" "scw-k8s-seblab" {
  name = "scw-k8s-seblab"
  description = "SEBLAB Kubernetes cluster"
  version = var.kapsule_k8s_version
  cni = var.kapsule_cni
  ingress = var.kapsule_ingress
}

resource "scaleway_k8s_pool_beta" "scw-k8s-seblab-workers" {
  cluster_id = scaleway_k8s_cluster_beta.scw-k8s-seblab.id
  name = "scw-k8s-seblab-workers"
  node_type = var.kapsule_node_type
  size = var.kapsule_pool_size
}