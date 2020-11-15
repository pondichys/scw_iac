resource "scaleway_k8s_cluster_beta" "scw-k8s-seblab" {
  name = "scw-k8s-seblab"
  version = var.kapsule_k8s_version
  cni = var.kapsule_cni
}

resource "scaleway_k8s_pool_beta" "scw-k8s-seblab-workers" {
  cluster_id = scaleway_k8s_cluster_beta.scw-k8s-seblab.id
  name = "scw-k8s-seblab-workers"
  node_type = var.kapsule_node_type
  size = var.kapsule_pool_size
}

resource "local_file" "kubeconfig" {
  content = scaleway_k8s_cluster_beta.scw-k8s-seblab.kubeconfig[0].config_file
  filename = "${path.module}/kubeconfig"
}

output "cluster_url" {
  value = scaleway_k8s_cluster_beta.scw-k8s-seblab.apiserver_url
}