resource "desec_domain" "jakehowardtech" {
  name = "jakehoward.tech"
}

resource "desec_rrset" "jakehowardtech_mx" {
  domain  = desec_domain.jakehowardtech.name
  subname = ""
  type    = "MX"
  ttl     = local.dns_ttl_default
  records = [
    "10 in1-smtp.messagingengine.com.",
    "20 in2-smtp.messagingengine.com.",
  ]
}

resource "desec_rrset" "jakehowardtech_dkim_fm1" {
  domain  = desec_domain.jakehowardtech.name
  subname = "fm1._domainkey"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "fm1.jakehoward.tech.dkim.fmhosted.com."
  ]
}

resource "desec_rrset" "jakehowardtech_dkim_fm2" {
  domain  = desec_domain.jakehowardtech.name
  subname = "fm2._domainkey"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "fm2.jakehoward.tech.dkim.fmhosted.com."
  ]
}

resource "desec_rrset" "jakehowardtech_dkim_fm3" {
  domain  = desec_domain.jakehowardtech.name
  subname = "fm3._domainkey"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "fm3.jakehoward.tech.dkim.fmhosted.com."
  ]
}

resource "desec_rrset" "jakehowardtech_dmarc" {
  domain  = desec_domain.jakehowardtech.name
  subname = "_dmarc"
  type    = "TXT"
  ttl     = local.dns_ttl_default
  records = [
    "\"v=DMARC1; p=quarantine; ruf=mailto:dmarc-report@jakehoward.tech;\""
  ]
}

resource "desec_rrset" "jakehowardtech_txt" {
  domain  = desec_domain.jakehowardtech.name
  subname = ""
  type    = "TXT"
  ttl     = local.dns_ttl_default
  records = [
    "\"v=spf1 include:spf.messagingengine.com -all\""
  ]
}

resource "desec_rrset" "jakehowardtech_speed" {
  domain  = desec_domain.jakehowardtech.name
  subname = "speed"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_media" {
  domain  = desec_domain.jakehowardtech.name
  subname = "media"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_intersect" {
  domain  = desec_domain.jakehowardtech.name
  subname = "intersect"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_calibre" {
  domain  = desec_domain.jakehowardtech.name
  subname = "calibre"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_homeassistant" {
  domain  = desec_domain.jakehowardtech.name
  subname = "homeassistant"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve_private.subname}.${desec_rrset.sys_domain_pve_private.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_grafana" {
  domain  = desec_domain.jakehowardtech.name
  subname = "grafana"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_vaultwarden" {
  domain  = desec_domain.jakehowardtech.name
  subname = "vaultwarden"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve_private.subname}.${desec_rrset.sys_domain_pve_private.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_recipes" {
  domain  = desec_domain.jakehowardtech.name
  subname = "recipes"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_mailgun_spf" {
  domain  = desec_domain.jakehowardtech.name
  subname = "mg"
  type    = "TXT"
  ttl     = local.dns_ttl_default
  records = [
    "\"v=spf1 include:mailgun.org -all\""
  ]
}

resource "desec_rrset" "jakehowardtech_mailgun_dkim" {
  domain  = desec_domain.jakehowardtech.name
  subname = "s1._domainkey.mg"
  type    = "TXT"
  ttl     = local.dns_ttl_default
  records = [
    "\"k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4E4cv86U+sFUjgLys26ZLccTghzGfHiFpitWdFg68lGXG63aoG2/+9bgKVT0ZBG7bjPvj6Kyj4N3TIe4oCJo2saVvtsNK1pvZ\" \"kOadaBPgjzKeRvBaw48ZatUGKoV7q1NCa0kXAfiJleF7bMvbt8rYDmBljr/BG6TtZYPt6XgoZyh8HHXjv/1L6WT3JBVQ8q5UtqVRVujXNHf57FmJTOJpvs0bKn/6TUaXYZmt5z3jpDhc/HfmkzVV22\" \"AwRf9jn7kgKkgaKpkvfSL8gtYNn5oyfS0Y9W9x9ntqb4g72RCbynMppQb1uwxbIuWRVOp0un0koQDm3C8ZzhOOYAwe58BYQIDAQAB\""
  ]
}

resource "desec_rrset" "jakehowardtech_mailgun_dmarc" {
  domain  = desec_domain.jakehowardtech.name
  subname = "_dmarc.mg"
  type    = "TXT"
  ttl     = local.dns_ttl_default
  records = [
    "\"v=DMARC1; p=quarantine; ruf=mailto:dmarc-report@jakehoward.tech;\""
  ]
}

resource "desec_rrset" "jakehowardtech_synapse_admin" {
  domain  = desec_domain.jakehowardtech.name
  subname = "synapse-admin"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_grimes.subname}.${desec_rrset.sys_domain_grimes.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_apex" {
  domain  = desec_domain.jakehowardtech.name
  subname = ""
  type    = "A"
  ttl     = local.dns_ttl_default
  records = desec_rrset.sys_domain_walker.records
}

resource "desec_rrset" "jakehowardtech_apex_v6" {
  domain  = desec_domain.jakehowardtech.name
  subname = ""
  type    = "AAAA"
  ttl     = local.dns_ttl_default
  records = desec_rrset.sys_domain_walker_v6.records
}

resource "desec_rrset" "jakehowardtech_collabora" {
  domain  = desec_domain.jakehowardtech.name
  subname = "collabora"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_tasks" {
  domain  = desec_domain.jakehowardtech.name
  subname = "tasks"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_auth" {
  domain  = desec_domain.jakehowardtech.name
  subname = "auth"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_ntfy" {
  domain  = desec_domain.jakehowardtech.name
  subname = "ntfy"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_headscale" {
  domain  = desec_domain.jakehowardtech.name
  subname = "headscale"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_casey.subname}.${desec_rrset.sys_domain_casey.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_slides" {
  domain  = desec_domain.jakehowardtech.name
  subname = "slides"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_walker.subname}.${desec_rrset.sys_domain_walker.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_uptime" {
  domain  = desec_domain.jakehowardtech.name
  subname = "uptime"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_baby-buddy" {
  domain  = desec_domain.jakehowardtech.name
  subname = "baby-buddy"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve_private.subname}.${desec_rrset.sys_domain_pve_private.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_immich" {
  domain  = desec_domain.jakehowardtech.name
  subname = "immich"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve_private.subname}.${desec_rrset.sys_domain_pve_private.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_photos" {
  domain  = desec_domain.jakehowardtech.name
  subname = "photos"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_freshrss" {
  domain  = desec_domain.jakehowardtech.name
  subname = "freshrss"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve_private.subname}.${desec_rrset.sys_domain_pve_private.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_atuin" {
  domain  = desec_domain.jakehowardtech.name
  subname = "atuin"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve_private.subname}.${desec_rrset.sys_domain_pve_private.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_karakeep" {
  domain  = desec_domain.jakehowardtech.name
  subname = "karakeep"
  type    = "CNAME"
  ttl     = local.dns_ttl_default
  records = [
    "${desec_rrset.sys_domain_pve_private.subname}.${desec_rrset.sys_domain_pve_private.domain}."
  ]
}

resource "desec_rrset" "jakehowardtech_caa" {
  domain  = desec_domain.jakehowardtech.name
  subname = ""
  type    = "CAA"
  ttl     = local.dns_ttl_default
  records = [
    "0 issue \"letsencrypt.org\"",
    "0 wildissue \"letsencrypt.org\"",
  ]
}
