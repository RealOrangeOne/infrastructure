module "grimes_firewall" {
  source = "./vultr_firewall/"

  description = "grimes"
  ports = [
    "80/tcp",
    "443/tcp",
  ]
}


resource "vultr_instance" "grimes" {
  plan              = "vhf-1c-1gb"
  region            = "lhr"
  hostname          = "grimes"
  firewall_group_id = module.grimes_firewall.firewall_group.id
}
