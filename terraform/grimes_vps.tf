resource "hcloud_server" "grimes" {
  name               = "grimes"
  image              = "debian-12"
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

resource "hcloud_rdns" "grimes_reverse_ipv4" {
  server_id  = hcloud_server.grimes.id
  ip_address = hcloud_server.grimes.ipv4_address
  dns_ptr    = "${desec_rrset.sys_domain_grimes.subname}.${desec_rrset.sys_domain_grimes.domain}"
}

resource "hcloud_rdns" "grimes_reverse_ipv6" {
  server_id  = hcloud_server.grimes.id
  ip_address = hcloud_server.grimes.ipv6_address
  dns_ptr    = "${desec_rrset.sys_domain_grimes.subname}.${desec_rrset.sys_domain_grimes.domain}"
}
