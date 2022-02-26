resource "scaleway_object_bucket" "tf-sebpon-nas-backup" {
  name = "sebpon-nas-backup"
}

resource "scaleway_object_bucket" "tf-seblab-k8s-backup" {
  name = "seblab-k8s-backup"
}

resource "scaleway_object_bucket" "tf_sebpon_linux_backup" {
  name = "sebpon-linux-backup"
}