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
  value   = "v=spf1 include:spf.messagingengine.com -all"
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

resource "cloudflare_record" "jakehowardtech_dmarc" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "_dmarc"
  value   = "v=DMARC1; p=quarantine; ruf=mailto:dmarc-report@jakehoward.tech;"
  type    = "TXT"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_wallabag" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "wallabag"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_ttrss" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "tt-rss"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_speed" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "speed"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_quassel" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "quassel"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_media" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "media"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_matrix" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "matrix"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_intersect" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "intersect"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_calibre" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "calibre"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_homeassistant" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "homeassistant"
  value   = cloudflare_record.sys_domain_private.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_grafana" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "grafana"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_vaultwarden" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "vaultwarden"
  value   = cloudflare_record.sys_domain_private.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_tandoor" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "recipes"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_mailgun_spf" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "mg"
  value   = "v=spf1 include:mailgun.org -all"
  type    = "TXT"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_mailgun_dkim" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "s1._domainkey.mg"
  value   = "k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4E4cv86U+sFUjgLys26ZLccTghzGfHiFpitWdFg68lGXG63aoG2/+9bgKVT0ZBG7bjPvj6Kyj4N3TIe4oCJo2saVvtsNK1pvZkOadaBPgjzKeRvBaw48ZatUGKoV7q1NCa0kXAfiJleF7bMvbt8rYDmBljr/BG6TtZYPt6XgoZyh8HHXjv/1L6WT3JBVQ8q5UtqVRVujXNHf57FmJTOJpvs0bKn/6TUaXYZmt5z3jpDhc/HfmkzVV22AwRf9jn7kgKkgaKpkvfSL8gtYNn5oyfS0Y9W9x9ntqb4g72RCbynMppQb1uwxbIuWRVOp0un0koQDm3C8ZzhOOYAwe58BYQIDAQAB"
  type    = "TXT"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_mailgun_dmarc" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "_dmarc.mg"
  value   = "v=DMARC1; p=quarantine; ruf=mailto:dmarc-report@jakehoward.tech;"
  type    = "TXT"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_matrix_admin" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "synapse-admin"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

# Cloudflare supports CNAME flattening - so this is ok
resource "cloudflare_record" "jakehowardtech_apex" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "@"
  value   = cloudflare_record.sys_domain_walker.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_collabora" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "collabora"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_tasks" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "tasks"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_auth" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "auth"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_minio" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "minio"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_s3" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "s3"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_ntfy" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "ntfy"
  value   = cloudflare_record.sys_domain_pve.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_headscale" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "headscale"
  value   = cloudflare_record.sys_domain_casey.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_slides" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "slides"
  value   = cloudflare_record.sys_domain_walker.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "jakehowardtech_caa" {
  zone_id = cloudflare_zone.jakehowardtech.id
  name    = "@"
  type    = "CAA"
  ttl     = 1

  data = {
    tag   = "issue"
    flags = 0
    value = "letsencrypt.org"
  }
}
