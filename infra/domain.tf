resource "digitalocean_domain" "domain_exemplo" {
  name = var.domain
  #   ip_address = digitalocean_loadbalancer.loadbalancer_exemplo.ip
}

resource "digitalocean_record" "CNAME_exemplo" {
  domain = digitalocean_domain.domain_exemplo.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
}
