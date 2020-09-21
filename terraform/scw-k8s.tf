resource "scaleway_k8s_cluster_beta" "scw-k8s-seblab" {
  name = "scw-k8s-seblab"
  version = "1.19.0"
  cni = "cilium"
}

resource "scaleway_k8s_pool_beta" "scw-k8s-seblab-workers" {
  cluster_id = scaleway_k8s_cluster_beta.scw-k8s-seblab.id
  name = "scw-k8s-seblab-workers"
  node_type = "DEV1-M"
  size = 1
}