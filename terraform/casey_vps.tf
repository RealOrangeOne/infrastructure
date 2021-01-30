resource "vultr_server" "casey" {
  plan_id           = 200
  region_id         = 8
  os_id             = 159
  hostname          = "casey"
  firewall_group_id = vultr_firewall_group.casey.id
}

resource "vultr_firewall_group" "casey" {
  description = "casey"
}

resource "vultr_firewall_rule" "casey_ping" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "icmp"
  network           = "0.0.0.0/0"
}

resource "vultr_firewall_rule" "casey_web" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "tcp"
  from_port         = 80
  network           = "0.0.0.0/0"
}

resource "vultr_firewall_rule" "casey_web_secure" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "tcp"
  from_port         = 443
  network           = "0.0.0.0/0"
}

resource "vultr_firewall_rule" "casey_wireguard" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "udp"
  from_port         = 51820
  network           = "0.0.0.0/0"
}

resource "vultr_firewall_rule" "casey_quassel" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "tcp"
  from_port         = 4242
  network           = "0.0.0.0/0"
}

resource "vultr_firewall_rule" "casey_matrix" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "tcp"
  from_port         = 8448
  network           = "0.0.0.0/0"
}

resource "vultr_firewall_rule" "casey_mc" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "tcp"
  from_port         = 25566
  network           = "0.0.0.0/0"
}

resource "vultr_firewall_rule" "casey_nebula" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "udp"
  from_port         = 6328
  network           = "0.0.0.0/0"
}
