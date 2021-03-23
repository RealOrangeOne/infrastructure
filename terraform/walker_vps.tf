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

resource "vultr_firewall_rule" "walker_web" {
  firewall_group_id = vultr_firewall_group.walker.id
  protocol          = "tcp"
  port              = 80
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
}

resource "vultr_firewall_rule" "walker_web_secure" {
  firewall_group_id = vultr_firewall_group.walker.id
  protocol          = "tcp"
  port              = 443
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
}
