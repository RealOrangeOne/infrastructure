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
  value   = "v=spf1 include:spf.messagingengine.com ?all"
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
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_ttrss" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "tt-rss"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_traefik" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "traefik"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_speed" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "speed"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_quassel" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "quassel"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_portainer" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "portainer"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_pihole" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "pihole"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_onlyoffice" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "onlyoffice"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_netdata" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "netdata"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_media" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "media"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_matrix" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "matrix"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_intersect" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "intersect"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_gotify" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "gotify"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_fah" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "fah"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_duplicati" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "duplicati"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_deluge" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "deluge"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_calibre" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "calibre"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_mc" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "mc"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}
