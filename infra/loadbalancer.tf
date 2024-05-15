resource "digitalocean_loadbalancer" "loadbalancer_exemplo" {
  name                   = "loadbalancer-exemplo"
  region                 = var.region
  droplet_ids            = digitalocean_droplet.droplet_exemplo.*.id
  redirect_http_to_https = true

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = 80
    target_protocol = "http"

    certificate_name = digitalocean_certificate.certificate_exemplo.name
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }
}

output "ip_address_lb" {
  value       = digitalocean_loadbalancer.loadbalancer_exemplo.ip
  description = "IP externo do loadbalancer."
}
