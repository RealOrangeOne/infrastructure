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
