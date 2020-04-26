resource "vultr_server" "grimes" {
  plan_id           = 201
  region_id         = 8
  os_id             = 159
  hostname          = "grimes"
  firewall_group_id = vultr_firewall_group.grimes.id
}

resource "vultr_firewall_group" "grimes" {
  description = "grimes"
}

resource "vultr_firewall_rule" "grimes_ping" {
  firewall_group_id = vultr_firewall_group.grimes.id
  protocol          = "icmp"
  network           = "0.0.0.0/0"
}
