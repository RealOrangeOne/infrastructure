resource "cloudflare_zone" "theorangeonenet" {
  zone = "theorangeone.net"
}

resource "cloudflare_record" "theorangeonenet_git" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "git"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_go" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "go"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_stats" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "stats"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_whoami" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "whoami"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_mx1" {
  zone_id  = cloudflare_zone.theorangeonenet.id
  name     = "@"
  value    = "in1-smtp.messagingengine.com"
  type     = "MX"
  priority = 10
  ttl      = 1
}

resource "cloudflare_record" "theorangeonenet_mx2" {
  zone_id  = cloudflare_zone.theorangeonenet.id
  name     = "@"
  value    = "in2-smtp.messagingengine.com"
  type     = "MX"
  priority = 20
  ttl      = 1
}

resource "cloudflare_record" "theorangeonenet_txt" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "@"
  value   = "v=spf1 include:spf.messagingengine.com ?all"
  type    = "TXT"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_dkim_fm1" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "fm1._domainkey"
  value   = "fm1.theorangeone.net.dkim.fmhosted.com"
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_dkim_fm2" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "fm2._domainkey"
  value   = "fm2.theorangeone.net.dkim.fmhosted.com"
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_dkim_fm3" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "fm3._domainkey"
  value   = "fm3.theorangeone.net.dkim.fmhosted.com"
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_www" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "www"
  value   = "theorangeone-net.netlify.com"
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_apex" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "@"
  value   = "theorangeone-net.netlify.com"
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_snippets" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "snippets"
  value   = "too-snippets.netlify.com"
  type    = "CNAME"
  ttl     = 1
}
