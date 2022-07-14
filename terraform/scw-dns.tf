resource "scaleway_domain_zone" "blue" {
  domain = "seblab.be"
  subdomain = "blue"
}

resource "scaleway_domain_zone" "green" {
  domain = "seblab.be"
  subdomain = "green"
}