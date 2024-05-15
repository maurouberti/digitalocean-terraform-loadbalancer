resource "digitalocean_droplet" "droplet_exemplo" {
  count    = 2
  name     = "droplet-exemplo-${count.index + 1}"
  image    = var.distro_image
  region   = var.region
  size     = var.droplet_size
  tags     = ["droplet-exemplo"]
  ssh_keys = [digitalocean_ssh_key.ssh_key_exemplo.fingerprint]

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = var.pvt_key
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt update",
      "sudo apt install -y nginx"
    ]
  }
}

output "ip_address_droplet_1" {
  value       = digitalocean_droplet.droplet_exemplo[0].ipv4_address
  description = "IP externo do Droplet 1."
}

output "ip_address_droplet_2" {
  value       = digitalocean_droplet.droplet_exemplo[1].ipv4_address
  description = "IP externo do Droplet 2."
}
