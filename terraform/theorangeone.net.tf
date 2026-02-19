resource "desec_domain" "theorangeonenet" {
  name = "theorangeone.net"
}

resource "desec_rrset" "theorangeonenet_git" {
  domain  = desec_domain.theorangeonenet.name
  subname = "git"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "theorangeonenet_whoami" {
  domain  = desec_domain.theorangeonenet.name
  subname = "whoami"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "theorangeonenet_mx" {
  domain  = desec_domain.theorangeonenet.name
  subname = ""
  type    = "MX"
  ttl     = 3600
  records = [
    "10 in1-smtp.messagingengine.com.",
    "20 in2-smtp.messagingengine.com.",
  ]
}

resource "desec_rrset" "theorangeonenet_dkim_fm1" {
  domain  = desec_domain.theorangeonenet.name
  subname = "fm1._domainkey"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "fm1.theorangeone.net.dkim.fmhosted.com."
  ]
}

resource "desec_rrset" "theorangeonenet_dkim_fm2" {
  domain  = desec_domain.theorangeonenet.name
  subname = "fm2._domainkey"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "fm2.theorangeone.net.dkim.fmhosted.com."
  ]
}

resource "desec_rrset" "theorangeonenet_dkim_fm3" {
  domain  = desec_domain.theorangeonenet.name
  subname = "fm3._domainkey"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "fm3.theorangeone.net.dkim.fmhosted.com."
  ]
}

resource "desec_rrset" "theorangeonenet_dmarc" {
  domain  = desec_domain.theorangeonenet.name
  subname = "_dmarc"
  type    = "TXT"
  ttl     = 3600
  records = [
    "\"v=DMARC1; p=quarantine; ruf=mailto:dmarc-report@jakehoward.tech;\""
  ]
}

resource "desec_rrset" "theorangeonenet_dmarc_report" {
  for_each = toset([
    desec_domain.theorangeonenet.name,
    desec_domain.jakehowardtech.name,
    "${desec_rrset.theorangeonenet_mailgun_spf.subname}.${desec_rrset.theorangeonenet_mailgun_spf.domain}",
    "${desec_rrset.jakehowardtech_mailgun_spf.subname}.${desec_rrset.jakehowardtech_mailgun_spf.domain}"
  ])

  domain  = desec_domain.theorangeonenet.name
  subname = "${each.value}._report._dmarc"
  type    = "TXT"
  ttl     = 3600
  records = [
    "\"v=DMARC1\""
  ]
}

resource "desec_rrset" "theorangeonenet_txt" {
  domain  = desec_domain.theorangeonenet.name
  subname = ""
  type    = "TXT"
  ttl     = 3600
  records = [
    "\"google-site-verification=IXY4iSBN_vOcM3cp_f-BgVvEI_shz1GzXuY_8dqY61o\"",
    "\"v=spf1 include:spf.messagingengine.com -all\""
  ]
}

resource "desec_rrset" "theorangeonenet_apex" {
  domain  = desec_domain.theorangeonenet.name
  subname = ""
  type    = "A"
  ttl     = 3600
  records = desec_rrset.sys_domain_walker.records
}

resource "desec_rrset" "theorangeonenet_apex_v6" {
  domain  = desec_domain.theorangeonenet.name
  subname = ""
  type    = "AAAA"
  ttl     = 3600
  records = desec_rrset.sys_domain_walker_v6.records
}

resource "desec_rrset" "theorangeonenet_srv_matrix" {
  domain  = desec_domain.theorangeonenet.name
  subname = "_matrix._tcp"
  type    = "SRV"
  ttl     = 3600
  records = [
    "10 0 8448 ${desec_rrset.theorangeonenet_matrix.subname}.${desec_rrset.theorangeonenet_matrix.domain}."
  ]
}

resource "desec_rrset" "theorangeonenet_matrix" {
  domain  = desec_domain.theorangeonenet.name
  subname = "matrix"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "theorangeonenet_plausible" {
  domain  = desec_domain.theorangeonenet.name
  subname = "plausible"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "${desec_rrset.sys_domain_walker.subname}.${desec_rrset.sys_domain_walker.domain}."
  ]
}

resource "desec_rrset" "theorangeonenet_plausible_bare" {
  domain  = desec_domain.theorangeonenet.name
  subname = "elbisualp"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "${desec_rrset.sys_domain_walker.subname}.${desec_rrset.sys_domain_walker.domain}."
  ]
}

resource "desec_rrset" "theorangeonenet_notes" {
  domain  = desec_domain.theorangeonenet.name
  subname = "notes"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "realorangeone.github.io."
  ]
}

resource "desec_rrset" "theorangeonenet_bin" {
  domain  = desec_domain.theorangeonenet.name
  subname = "bin"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."
  ]
}

resource "desec_rrset" "theorangeonenet_mailgun_spf" {
  domain  = desec_domain.theorangeonenet.name
  subname = "mg"
  type    = "TXT"
  ttl     = 3600
  records = [
    "\"v=spf1 include:mailgun.org -all\""
  ]
}

resource "desec_rrset" "theorangeonenet_mailgun_dkim" {
  domain  = desec_domain.theorangeonenet.name
  subname = "mta._domainkey.mg"
  type    = "TXT"
  ttl     = 3600
  records = [
    "\"k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1Z/MHEzpbWm5EgMkyWb+Xkz44Xrzr4SA5i2u8M2H5yZ1PSb4DpGk3IAX+I05UWax02+WBW3CBb5wU9rH9flgxezBoCf/hiMS1\" \"Wjb9hKGIBa2jMCzpF+wa5fyqLkLoAJZF4bc/BJKyi/ET2c7+DAA/2KlWv/nv4MEjcUR4hNGLPEC9+6PhUp8z2PnUQLzPRWHpKc1oLrnROWaX3XxdDekCzwyOw7ygzZdThVevE+0CqXVOt5SUSUCnd2\" \"tjVbvblGi6DBiQY5Tl6+xLqkQHCRqks9187+EN4FdJXkjQodkFzzyiBH5cXVGiZLOhal4koEvxGirr596qM97bIXiJWArdQIDAQAB\""
  ]
}

resource "desec_rrset" "theorangeonenet_mailgun_dmarc" {
  domain  = desec_domain.theorangeonenet.name
  subname = "_dmarc.mg"
  type    = "TXT"
  ttl     = 3600
  records = [
    "\"v=DMARC1; p=quarantine; ruf=mailto:dmarc-report@jakehoward.tech;\""
  ]
}

resource "desec_rrset" "theorangeonenet_mastodon" {
  domain  = desec_domain.theorangeonenet.name
  subname = "mastodon"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "${desec_rrset.sys_domain_grimes.subname}.${desec_rrset.sys_domain_grimes.domain}."
  ]
}

resource "desec_rrset" "theorangeonenet_comentario" {
  domain  = desec_domain.theorangeonenet.name
  subname = "comentario"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "${desec_rrset.sys_domain_walker.subname}.${desec_rrset.sys_domain_walker.domain}."
  ]
}

resource "desec_rrset" "theorangeonenet_bsky" {
  domain  = desec_domain.theorangeonenet.name
  subname = "bsky"
  type    = "CNAME"
  ttl     = 3600
  records = [
    "${desec_rrset.sys_domain_grimes.subname}.${desec_rrset.sys_domain_grimes.domain}."
  ]
}

resource "desec_rrset" "theorangeonenet_atproto" {
  domain  = desec_domain.theorangeonenet.name
  subname = "_atproto"
  type    = "TXT"
  ttl     = 3600
  records = [
    "\"did=did:plc:pgyg4ih7zsqkwdon34jqkbuz\""
  ]
}

resource "desec_rrset" "theorangeonenet_caa" {
  domain  = desec_domain.theorangeonenet.name
  subname = ""
  type    = "CAA"
  ttl     = 3600
  records = [
    "0 issue \"letsencrypt.org\"",
    "0 wildissue \"letsencrypt.org\"",
  ]
}
