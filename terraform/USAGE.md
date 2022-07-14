<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.6.0 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement\_scaleway) | ~>2.2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm.green"></a> [helm.green](#provider\_helm.green) | 2.6.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.1 |
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | 2.2.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd_green](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [null_resource.kubeconfig_green](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [scaleway_domain_zone.blue](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/domain_zone) | resource |
| [scaleway_domain_zone.green](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/domain_zone) | resource |
| [scaleway_k8s_cluster.green](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_cluster) | resource |
| [scaleway_k8s_cluster.scw-k8s-seblab](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_cluster) | resource |
| [scaleway_k8s_pool.green](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_pool) | resource |
| [scaleway_k8s_pool.scw-k8s-seblab-workers](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/k8s_pool) | resource |
| [scaleway_object_bucket.tf-seblab-k8s-backup](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/object_bucket) | resource |
| [scaleway_object_bucket.tf-sebpon-nas-backup](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/object_bucket) | resource |
| [scaleway_object_bucket.tf_sebpon_linux_backup](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/object_bucket) | resource |
| [scaleway_registry_namespace.scw_cr_tf](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/registry_namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd_green_version"></a> [argocd\_green\_version](#input\_argocd\_green\_version) | Version of ArgoCD Helm chart to deploy on green cluster. | `string` | `"4.9.12"` | no |
| <a name="input_kapsule_cni"></a> [kapsule\_cni](#input\_kapsule\_cni) | Kubernetes CNI for blue Kapsule cluser. | `string` | `"cilium"` | no |
| <a name="input_kapsule_green_k8s_version"></a> [kapsule\_green\_k8s\_version](#input\_kapsule\_green\_k8s\_version) | Version of Kubernetes for green Kapsule cluster. Must not contain patch as we enable autoupgrade. | `string` | `"1.23"` | no |
| <a name="input_kapsule_green_pool_size"></a> [kapsule\_green\_pool\_size](#input\_kapsule\_green\_pool\_size) | Number of nodes for the main node pool of the green Kapsule cluster. | `number` | `2` | no |
| <a name="input_kapsule_k8s_version"></a> [kapsule\_k8s\_version](#input\_kapsule\_k8s\_version) | Version of Kubernetes for blue Kapsule cluster. | `string` | `"1.20.4"` | no |
| <a name="input_kapsule_node_type"></a> [kapsule\_node\_type](#input\_kapsule\_node\_type) | Type of VMs to use in node pools. | `string` | `"DEV1-M"` | no |
| <a name="input_kapsule_pool_size"></a> [kapsule\_pool\_size](#input\_kapsule\_pool\_size) | Number of nodes for the main node pool of the blue Kapsule cluster. | `number` | `1` | no |
| <a name="input_region"></a> [region](#input\_region) | Scaleway region where resources are deployed. | `string` | `"fr-par"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Scaleway zone where resources are deployed. | `string` | `"fr-par-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_seblab_k8s_cluster_url"></a> [seblab\_k8s\_cluster\_url](#output\_seblab\_k8s\_cluster\_url) | n/a |
| <a name="output_seblab_k8s_nodes_dns"></a> [seblab\_k8s\_nodes\_dns](#output\_seblab\_k8s\_nodes\_dns) | n/a |
| <a name="output_seblabcr_priv_uri"></a> [seblabcr\_priv\_uri](#output\_seblabcr\_priv\_uri) | n/a |
| <a name="output_sebpon_linux_backup"></a> [sebpon\_linux\_backup](#output\_sebpon\_linux\_backup) | n/a |
<!-- END_TF_DOCS -->