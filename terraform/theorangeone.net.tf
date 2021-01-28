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

resource "cloudflare_record" "theorangeonenet_gitea" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "gitea"
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

resource "cloudflare_record" "theorangeonenet_apex" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "@"
  value   = linode_instance.grimes.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_srv_matrix" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "_matrix._tcp"
  type    = "SRV"
  ttl     = 1

  data = {
    service  = "_matrix"
    proto    = "_tcp"
    name     = "theorangeone.net"
    priority = 10
    weight   = 0
    port     = 8448
    target   = cloudflare_record.jakehowardtech_matrix.hostname
  }
}

resource "cloudflare_record" "theorangeonenet_img" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "img"
  value   = linode_instance.grimes.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_dl" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "dl"
  value   = linode_instance.grimes.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_bg" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "bg"
  value   = linode_instance.grimes.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_upload" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "upload"
  value   = linode_instance.grimes.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_plausible" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "plausible"
  value   = linode_instance.grimes.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_plausible_bare" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "elbisualp"
  value   = linode_instance.grimes.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_pages" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "pages"
  value   = linode_instance.grimes.ip_address
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_notes" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "notes"
  value   = cloudflare_record.theorangeonenet_pages.hostname
  type    = "CNAME"
  ttl     = 1
}
