locals {
  walker_open_ports = toset([
    "80/tcp",
    "443/tcp",
  ])
}

resource "vultr_instance" "walker" {
  plan              = "vhf-1c-1gb"
  region            = "lhr"
  hostname          = "walker"
  firewall_group_id = vultr_firewall_group.walker.id
}

resource "vultr_firewall_group" "walker" {
  description = "walker"
}

resource "vultr_firewall_rule" "walker_ping" {
  firewall_group_id = vultr_firewall_group.walker.id
  protocol          = "icmp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
}

resource "vultr_firewall_rule" "walker_pingv6" {
  firewall_group_id = vultr_firewall_group.walker.id
  protocol          = "icmp"
  ip_type           = "v6"
  subnet            = "::"
  subnet_size       = 0
}

resource "vultr_firewall_rule" "walker_v4" {
  for_each = local.walker_open_ports

  firewall_group_id = vultr_firewall_group.walker.id
  protocol          = split("/", each.value)[1]
  port              = split("/", each.value)[0]
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
}

resource "vultr_firewall_rule" "walker_v6" {
  for_each = local.walker_open_ports

  firewall_group_id = vultr_firewall_group.walker.id
  protocol          = split("/", each.value)[1]
  port              = split("/", each.value)[0]
  ip_type           = "v6"
  subnet            = "::"
  subnet_size       = 0
}
