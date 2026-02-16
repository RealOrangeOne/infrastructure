data "gandi_livedns_domain" "jakehowardtech" {
  name = "jakehoward.tech"
}

resource "gandi_livedns_record" "jakehowardtech_mx" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "@"
  type = "MX"
  ttl  = 3600
  values = [
    "10 in1-smtp.messagingengine.com.",
    "20 in2-smtp.messagingengine.com.",
  ]
}

resource "gandi_livedns_record" "jakehowardtech_dkim_fm1" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "fm1._domainkey"
  type = "CNAME"
  ttl  = 3600
  values = [
    "fm1.jakehoward.tech.dkim.fmhosted.com."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_dkim_fm2" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "fm2._domainkey"
  type = "CNAME"
  ttl  = 3600
  values = [
    "fm2.jakehoward.tech.dkim.fmhosted.com."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_dkim_fm3" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "fm3._domainkey"
  type = "CNAME"
  ttl  = 3600
  values = [
    "fm3.jakehoward.tech.dkim.fmhosted.com."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_dmarc" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "_dmarc"
  type = "TXT"
  ttl  = 3600
  values = [
    "\"v=DMARC1; p=quarantine; ruf=mailto:dmarc-report@jakehoward.tech;\""
  ]
}

resource "gandi_livedns_record" "jakehowardtech_txt" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "@"
  type = "TXT"
  ttl  = 3600
  values = [
    "\"v=spf1 include:spf.messagingengine.com -all\""
  ]
}

resource "gandi_livedns_record" "jakehowardtech_speed" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "speed"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_media" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "media"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_matrix" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "matrix"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_grimes.name}.${gandi_livedns_record.sys_domain_grimes.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_intersect" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "intersect"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_calibre" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "calibre"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_homeassistant" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "homeassistant"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve_private.name}.${gandi_livedns_record.sys_domain_pve_private.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_grafana" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "grafana"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_vaultwarden" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "vaultwarden"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve_private.name}.${gandi_livedns_record.sys_domain_pve_private.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_recipes" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "recipes"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_mailgun_spf" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "mg"
  type = "TXT"
  ttl  = 3600
  values = [
    "\"v=spf1 include:mailgun.org -all\""
  ]
}

resource "gandi_livedns_record" "jakehowardtech_mailgun_dkim" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "s1._domainkey.mg"
  type = "TXT"
  ttl  = 3600
  values = [
    "\"k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4E4cv86U+sFUjgLys26ZLccTghzGfHiFpitWdFg68lGXG63aoG2/+9bgKVT0ZBG7bjPvj6Kyj4N3TIe4oCJo2saVvtsNK1pvZ\" \"kOadaBPgjzKeRvBaw48ZatUGKoV7q1NCa0kXAfiJleF7bMvbt8rYDmBljr/BG6TtZYPt6XgoZyh8HHXjv/1L6WT3JBVQ8q5UtqVRVujXNHf57FmJTOJpvs0bKn/6TUaXYZmt5z3jpDhc/HfmkzVV22\" \"AwRf9jn7kgKkgaKpkvfSL8gtYNn5oyfS0Y9W9x9ntqb4g72RCbynMppQb1uwxbIuWRVOp0un0koQDm3C8ZzhOOYAwe58BYQIDAQAB\""
  ]
}

resource "gandi_livedns_record" "jakehowardtech_mailgun_dmarc" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "_dmarc.mg"
  type = "TXT"
  ttl  = 3600
  values = [
    "\"v=DMARC1; p=quarantine; ruf=mailto:dmarc-report@jakehoward.tech;\""
  ]
}

resource "gandi_livedns_record" "jakehowardtech_synapse_admin" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "synapse-admin"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_grimes.name}.${gandi_livedns_record.sys_domain_grimes.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_apex" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "@"
  type = "ALIAS"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_walker.name}.${gandi_livedns_record.sys_domain_walker.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_collabora" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "collabora"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_tasks" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "tasks"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_auth" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "auth"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_ntfy" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "ntfy"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_headscale" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "headscale"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_casey.name}.${gandi_livedns_record.sys_domain_casey.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_slides" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "slides"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_walker.name}.${gandi_livedns_record.sys_domain_walker.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_uptime" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "uptime"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_baby-buddy" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "baby-buddy"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve_private.name}.${gandi_livedns_record.sys_domain_pve_private.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_immich" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "immich"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve_private.name}.${gandi_livedns_record.sys_domain_pve_private.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_photos" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "photos"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_freshrss" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "freshrss"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve_private.name}.${gandi_livedns_record.sys_domain_pve_private.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_atuin" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "atuin"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve_private.name}.${gandi_livedns_record.sys_domain_pve_private.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_karakeep" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "karakeep"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve_private.name}.${gandi_livedns_record.sys_domain_pve_private.zone}."
  ]
}

resource "gandi_livedns_record" "jakehowardtech_caa" {
  zone = data.gandi_livedns_domain.jakehowardtech.id
  name = "@"
  type = "CAA"
  ttl  = 3600
  values = [
    "0 issue \"letsencrypt.org\"",
    "0 wildissue \"letsencrypt.org\"",
  ]
}
