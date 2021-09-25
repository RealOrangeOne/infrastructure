module "decker_firewall" {
  source = "./vultr_firewall/"

  description = "decker"
  ports = [
    "80/tcp",
    "443/tcp",
  ]
}


resource "vultr_instance" "decker" {
  plan              = "vc2-1c-1gb"
  region            = "ams"
  hostname          = "decker"
  firewall_group_id = module.decker_firewall.firewall_group.id
}
