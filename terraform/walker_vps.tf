module "walker_firewall" {
  source = "./vultr_firewall/"

  description = "walker"
  ports = [
    "80/tcp",
    "443/tcp"
  ]
}


resource "vultr_instance" "walker" {
  plan              = "vhf-1c-1gb"
  region            = "lhr"
  hostname          = "walker"
  firewall_group_id = module.walker_firewall.firewall_group.id
}
