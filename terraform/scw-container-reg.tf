resource "scaleway_registry_namespace_beta" "scw_cr_tf" {
    name = "seblabcr_priv"
    description = "SEBLAB private container registry"
    is_public = false
}