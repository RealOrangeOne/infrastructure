module "walker_firewall" {
  source = "./vultr_firewall/"

  description = "walker"
  ports = [
    "80/tcp",
    "443/tcp",
    "41641/udp"
  ]
}

resource "vultr_instance" "walker" {
  plan              = "vhf-1c-2gb"
  region            = "lhr"
  hostname          = "walker"
  firewall_group_id = module.walker_firewall.firewall_group.id
}

resource "vultr_reverse_ipv4" "walker_reverse_ipv4" {
  instance_id = vultr_instance.walker.id
  ip          = vultr_instance.walker.main_ip
  reverse     = cloudflare_record.sys_domain_walker.hostname
}

resource "vultr_reverse_ipv6" "walker_reverse_ipv6" {
  instance_id = vultr_instance.walker.id
  ip          = vultr_instance.walker.v6_main_ip
  reverse     = cloudflare_record.sys_domain_walker.hostname
}
