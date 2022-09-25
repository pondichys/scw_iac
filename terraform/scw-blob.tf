# resource "scaleway_object_bucket" "tf-sebpon-nas-backup" {
#   name = "sebpon-nas-backup"
# }

# resource "scaleway_object_bucket" "tf-seblab-k8s-backup" {
#   name = "seblab-k8s-backup"
#   lifecycle_rule {
#     id      = "delete-after-30-days"
#     enabled = true
#     expiration {
#       days = 30
#     }
#   }
# }

# resource "scaleway_object_bucket" "tf_sebpon_linux_backup" {
#   name = "sebpon-linux-backup"
# }