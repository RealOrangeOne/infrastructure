locals {
  casey_open_ports = toset([
    "80/tcp",
    "443/tcp",
    "51820/udp",
    "4242/tcp",
    "8448/tcp",
    "6328/udp"
  ])
}


resource "vultr_instance" "casey" {
  plan              = "" # On a plan unsupported by API
  region            = "lhr"
  hostname          = "casey"
  firewall_group_id = vultr_firewall_group.casey.id
}

resource "vultr_firewall_group" "casey" {
  description = "casey"
}

resource "vultr_firewall_rule" "casey_ping" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "icmp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
}

resource "vultr_firewall_rule" "casey_pingv6" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "icmp"
  ip_type           = "v6"
  subnet            = "::"
  subnet_size       = 0
}

resource "vultr_firewall_rule" "casey_v4" {
  for_each = local.casey_open_ports

  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = split("/", each.value)[1]
  port              = split("/", each.value)[0]
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
}

resource "vultr_firewall_rule" "casey_v6" {
  for_each = local.casey_open_ports

  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = split("/", each.value)[1]
  port              = split("/", each.value)[0]
  ip_type           = "v6"
  subnet            = "::"
  subnet_size       = 0
}
