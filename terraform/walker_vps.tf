resource "hcloud_server" "walker" {
  name               = "walker"
  image              = "debian-12" # Not true - that was just the initial install.
  server_type        = "cx23"
  location           = "nbg1"
  delete_protection  = true
  rebuild_protection = true

  firewall_ids = [
    hcloud_firewall.base.id,
    hcloud_firewall.tailscale.id,
    hcloud_firewall.web.id,
  ]
}

resource "hcloud_rdns" "walker_reverse_ipv4" {
  server_id  = hcloud_server.walker.id
  ip_address = hcloud_server.walker.ipv4_address
  dns_ptr    = "${desec_rrset.sys_domain_walker.subname}.${desec_rrset.sys_domain_walker.domain}"
}

resource "hcloud_rdns" "walker_reverse_ipv6" {
  server_id  = hcloud_server.walker.id
  ip_address = hcloud_server.walker.ipv6_address
  dns_ptr    = "${desec_rrset.sys_domain_walker.subname}.${desec_rrset.sys_domain_walker.domain}"
}
