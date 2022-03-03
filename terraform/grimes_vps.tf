module "grimes_firewall" {
  source = "./vultr_firewall/"

  description = "grimes"
  ports = [
    "80/tcp",
    "443/tcp",
    "7743/tcp",
  ]
}

resource "vultr_instance" "grimes" {
  plan              = "vhf-1c-1gb"
  region            = "lhr"
  hostname          = "grimes"
  firewall_group_id = module.grimes_firewall.firewall_group.id
}

resource "vultr_reverse_ipv4" "grimes_reverse_ipv4" {
  instance_id = vultr_instance.grimes.id
  ip          = vultr_instance.grimes.main_ip
  reverse     = "grimes.sys.theorangeone.net"
}
