resource "cloudflare_record" "sys_domain_casey" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "casey.sys"
  value   = vultr_instance.casey.main_ip
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

resource "cloudflare_record" "sys_domain_grimes" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "grimes.sys"
  value   = vultr_instance.grimes.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "sys_domain_decker" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "decker.sys"
  value   = linode_instance.decker.ip_address
  type    = "A"
  ttl     = 1
}
