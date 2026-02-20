resource "desec_rrset" "sys_domain_casey" {
  domain  = desec_domain.theorangeonenet.name
  subname = "casey.sys"
  type    = "A"
  ttl     = local.dns_ttl_default
  records = [
    linode_instance.casey.ip_address
  ]
}

resource "desec_rrset" "sys_domain_casey_v6" {
  domain  = desec_domain.theorangeonenet.name
  subname = "casey.sys"
  type    = "AAAA"
  ttl     = local.dns_ttl_default
  records = [
    split("/", linode_instance.casey.ipv6)[0]
  ]
}

resource "desec_rrset" "sys_domain_walker" {
  domain  = desec_domain.theorangeonenet.name
  subname = "walker.sys"
  type    = "A"
  ttl     = local.dns_ttl_default
  records = [
    hcloud_server.walker.ipv4_address
  ]
}

resource "desec_rrset" "sys_domain_walker_v6" {
  domain  = desec_domain.theorangeonenet.name
  subname = "walker.sys"
  type    = "AAAA"
  ttl     = local.dns_ttl_default
  records = [
    hcloud_server.walker.ipv6_address
  ]
}

resource "desec_rrset" "sys_domain_pve" {
  domain  = desec_domain.theorangeonenet.name
  subname = "pve.sys"
  type    = "A"
  ttl     = local.dns_ttl_default
  records = [
    linode_instance.casey.ip_address
  ]
}

resource "desec_rrset" "sys_domain_pve_private" {
  domain  = desec_domain.theorangeonenet.name
  subname = "pve-private.sys"
  type    = "AAAA"
  ttl     = local.dns_ttl_default
  records = [
    local.private_ipv6_marker
  ]
}

resource "desec_rrset" "sys_domain_grimes" {
  domain  = desec_domain.theorangeonenet.name
  subname = "grimes.sys"
  type    = "A"
  ttl     = local.dns_ttl_default
  records = [
    hcloud_server.grimes.ipv4_address
  ]
}

resource "desec_rrset" "sys_domain_grimes_v6" {
  domain  = desec_domain.theorangeonenet.name
  subname = "grimes.sys"
  type    = "AAAA"
  ttl     = local.dns_ttl_default
  records = [
    hcloud_server.grimes.ipv6_address
  ]
}
