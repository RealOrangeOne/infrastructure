resource "cloudflare_record" "sys_domain_casey" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "casey.sys"
  value   = linode_instance.casey.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "sys_domain_walker" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "walker.sys"
  value   = hcloud_server.walker.ipv4_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "sys_domain_casey_v6" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "casey.sys"
  value   = split("/", linode_instance.casey.ipv6)[0]
  type    = "AAAA"
  ttl     = 1
}

resource "cloudflare_record" "sys_domain_walker_v6" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "walker.sys"
  value   = hcloud_server.walker.ipv6_address
  type    = "AAAA"
  ttl     = 1
}

resource "cloudflare_record" "sys_domain_pve" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "pve.sys"
  value   = linode_instance.casey.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "sys_domain_pve_private" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "pve-private.sys"
  value   = local.private_ipv6_marker
  type    = "AAAA"
  ttl     = 1
}
