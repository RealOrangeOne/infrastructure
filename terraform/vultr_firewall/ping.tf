resource "vultr_firewall_rule" "ping" {
  firewall_group_id = vultr_firewall_group.group.id
  protocol          = "icmp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
}

resource "vultr_firewall_rule" "pingv6" {
  firewall_group_id = vultr_firewall_group.group.id
  protocol          = "icmp"
  ip_type           = "v6"
  subnet            = "::"
  subnet_size       = 0
}
