resource "scaleway_object_bucket" "tf-sebpon-nas-backup" {
  name = "sebpon-nas-backup"
}

resource "scaleway_object_bucket" "tf-seblab-restic-backup" {
  name = "seblab-restic-backup"
}

resource "scaleway_object_bucket" "tf-seblab-loki-logs" {
  name = "seblab-loki-logs"
}