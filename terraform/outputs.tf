output "seblabcr_priv_uri" {
    value = scaleway_registry_namespace_beta.scw_cr_tf.endpoint
}

output "seblab_k8s_cluster_url" {
    value = scaleway_k8s_cluster_beta.scw-k8s-seblab.apiserver_url
}

output "seblab_k8s_nodes_dns" {
    value = scaleway_k8s_cluster_beta.scw-k8s-seblab.wildcard_dns
}