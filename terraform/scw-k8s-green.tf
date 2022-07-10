# This terraform file contains code to deploy another Kapsule k8s cluster
# This cluster is used for blue-green deployment of a new k8s version

resource "scaleway_k8s_cluster" "green" {
  name        = "seblab_k8s_green"
  type        = "kapsule"
  description = "Green cluster for seblab."
  version     = var.kapsule_green_k8s_version
  cni         = var.kapsule_cni
  auto_upgrade {
    enable                        = true
    maintenance_window_start_hour = 22
    maintenance_window_day        = "sunday"
  }
}

resource "scaleway_k8s_pool" "green" {
  cluster_id        = scaleway_k8s_cluster.green.id
  name              = format("default_green_%s", var.kapsule_node_type)
  node_type         = var.kapsule_node_type
  size              = var.kapsule_green_pool_size
  autohealing       = true
  container_runtime = "containerd"
}