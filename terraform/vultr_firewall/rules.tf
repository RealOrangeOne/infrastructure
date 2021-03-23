resource "vultr_firewall_rule" "v4" {
  for_each = toset(var.ports)

  firewall_group_id = vultr_firewall_group.group.id
  protocol          = split("/", each.value)[1]
  port              = split("/", each.value)[0]
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
}

resource "vultr_firewall_rule" "v6" {
  for_each = toset(var.ports)

  firewall_group_id = vultr_firewall_group.group.id
  protocol          = split("/", each.value)[1]
  port              = split("/", each.value)[0]
  ip_type           = "v6"
  subnet            = "::"
  subnet_size       = 0
}
