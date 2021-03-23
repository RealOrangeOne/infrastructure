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

resource "vultr_firewall_rule" "casey_web" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "tcp"
  port              = 80
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
}

resource "vultr_firewall_rule" "casey_web_secure" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "tcp"
  port              = 443
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
}

resource "vultr_firewall_rule" "casey_wireguard" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "udp"
  port              = 51820
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
}

resource "vultr_firewall_rule" "casey_quassel" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "tcp"
  port              = 4242
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
}

resource "vultr_firewall_rule" "casey_matrix" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "tcp"
  port              = 8448
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
}

resource "vultr_firewall_rule" "casey_nebula" {
  firewall_group_id = vultr_firewall_group.casey.id
  protocol          = "udp"
  port              = 6328
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
}
