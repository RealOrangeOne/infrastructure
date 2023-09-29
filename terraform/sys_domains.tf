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
  value   = vultr_instance.walker.main_ip
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
  value   = vultr_instance.walker.v6_main_ip
  type    = "AAAA"
  ttl     = 1
}
