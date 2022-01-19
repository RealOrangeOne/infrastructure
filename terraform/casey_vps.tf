module "casey_firewall" {
  source = "./vultr_firewall/"

  description = "casey"
  ports = [
    "80/tcp",
    "443/tcp",
    "51820/udp",
    "8448/tcp",
    "6328/udp"
  ]
}

resource "vultr_instance" "casey" {
  plan              = "" # On a plan unsupported by API
  region            = "lhr"
  hostname          = "casey"
  firewall_group_id = module.casey_firewall.firewall_group.id
}

resource "vultr_reverse_ipv4" "casey_reverse_ipv4" {
  instance_id = vultr_instance.casey.id
  ip          = vultr_instance.casey.main_ip
  reverse     = "casey.sys.theorangeone.net"
}
