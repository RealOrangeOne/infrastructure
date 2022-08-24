resource "cloudflare_zone" "jakehowardtech" {
  zone = "jakehoward.tech"
}

resource "cloudflare_record" "jakehowardtech_mx1" {
  zone_id  = cloudflare_zone.jakehowardtech.id
  name     = "@"
  value    = "in1-smtp.messagingengine.com"
  type     = "MX"
  priority = 10
  ttl      = 1
}

resource "cloudflare_record" "jakehowardtech_mx2" {
  zone_id  = cloudflare_zone.jakehowardtech.id
  name     = "@"
  value    = "in2-smtp.messagingengine.com"
  type     = "MX"
  priority = 20
  ttl      = 1
}

resource "cloudflare_record" "jakehowardtech_txt" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "@"
  value   = "v=spf1 include:spf.messagingengine.com ~all"
  type    = "TXT"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_dkim_fm1" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "fm1._domainkey"
  value   = "fm1.jakehoward.tech.dkim.fmhosted.com"
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_dkim_fm2" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "fm2._domainkey"
  value   = "fm2.jakehoward.tech.dkim.fmhosted.com"
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_dkim_fm3" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "fm3._domainkey"
  value   = "fm3.jakehoward.tech.dkim.fmhosted.com"
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_wallabag" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "wallabag"
  value   = linode_instance.casey.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_ttrss" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "tt-rss"
  value   = linode_instance.casey.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_speed" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "speed"
  value   = linode_instance.casey.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_quassel" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "quassel"
  value   = linode_instance.casey.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_media" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "media"
  value   = linode_instance.casey.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_matrix" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "matrix"
  value   = linode_instance.casey.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_intersect" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "intersect"
  value   = linode_instance.casey.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_calibre" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "calibre"
  value   = linode_instance.casey.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_homeassistant" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "homeassistant"
  value   = linode_instance.casey.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_grafana" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "grafana"
  value   = linode_instance.casey.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_vaultwarden" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "vaultwarden"
  value   = linode_instance.casey.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_tandoor" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "recipes"
  value   = linode_instance.casey.ip_address
  type    = "A"
  ttl     = 1
}
