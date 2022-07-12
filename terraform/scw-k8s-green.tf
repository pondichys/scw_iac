# This terraform file contains code to deploy the green Kapsule k8s cluster
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

# Get credentials to use for the Helm provider
resource "null_resource" "kubeconfig_green" {
  depends_on = [scaleway_k8s_pool.green] # at least one pool here
  triggers = {
    host                   = scaleway_k8s_cluster.green.kubeconfig[0].host
    token                  = scaleway_k8s_cluster.green.kubeconfig[0].token
    cluster_ca_certificate = scaleway_k8s_cluster.green.kubeconfig[0].cluster_ca_certificate
  }
}

resource "helm_release" "argocd_green" {
  provider         = helm.green
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_green_version
  namespace        = "argocd-system"
  create_namespace = true
  atomic           = true
  timeout          = 600

  # Disable dex OID authentication server. Not needed for my personal
  set {
    name  = "dex.enabled"
    value = "false"
  }
  # Start server without https. Required when exposed through Traefik ingress
  # See https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#traefik-v22
  set {
    name  = "server.extraArgs"
    value = "{--insecure}"
  }
}