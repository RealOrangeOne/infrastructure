resource "gandi_livedns_domain" "theorangeonenet" {
  name = "theorangeone.net"
}

resource "gandi_livedns_record" "theorangeonenet_git" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "git"
  type = "CNAME"
  ttl  = 3600
  values = [
    gandi_livedns_record.sys_domain_pve.href
  ]
}

resource "gandi_livedns_record" "theorangeonenet_whoami" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "whoami"
  type = "CNAME"
  ttl  = 3600
  values = [
    gandi_livedns_record.sys_domain_pve.href
  ]
}

resource "gandi_livedns_record" "theorangeonenet_whoami_cdn" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "whoami-cdn"
  type = "CNAME"
  ttl  = 3600
  values = [
    gandi_livedns_record.sys_domain_pve.href
  ]
}

resource "gandi_livedns_record" "theorangeonenet_whoami_private" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "whoami-private"
  type = "CNAME"
  ttl  = 3600
  values = [
    gandi_livedns_record.sys_domain_pve.href
  ]
}

resource "gandi_livedns_record" "theorangeonenet_mx" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "@"
  type = "MX"
  ttl  = 3600
  values = [
    "10 in1-smtp.messagingengine.com",
    "20 in2-smtp.messagingengine.com",
  ]
}

resource "gandi_livedns_record" "theorangeonenet_spf" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "@"
  type = "TXT"
  ttl  = 3600
  values = [
    "\"v=spf1 include:spf.messagingengine.com -all\""
  ]
}

resource "gandi_livedns_record" "theorangeonenet_dkim_fm1" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "fm1._domainkey"
  type = "CNAME"
  ttl  = 3600
  values = [
    "fm1.theorangeone.net.dkim.fmhosted.com"
  ]
}

resource "gandi_livedns_record" "theorangeonenet_dkim_fm2" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "fm2._domainkey"
  type = "CNAME"
  ttl  = 3600
  values = [
    "fm2.theorangeone.net.dkim.fmhosted.com"
  ]
}

resource "gandi_livedns_record" "theorangeonenet_dkim_fm3" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "fm3._domainkey"
  type = "CNAME"
  ttl  = 3600
  values = [
    "fm3.theorangeone.net.dkim.fmhosted.com"
  ]
}

resource "gandi_livedns_record" "theorangeonenet_dmarc" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "_dmarc"
  type = "TXT"
  ttl  = 3600
  values = [
    "\"v=DMARC1; p=quarantine; ruf=mailto:dmarc-report@jakehoward.tech;\""
  ]
}

resource "gandi_livedns_record" "theorangeonenet_dmarc_report" {
  for_each = toset([
    gandi_livedns_domain.theorangeonenet.name,
    gandi_livedns_domain.jakehowardtech.name,
    gandi_livedns_record.theorangeonenet_mailgun_spf.href,
    cloudflare_record.jakehowardtech_mailgun_spf.hostname,
  ])

  zone = gandi_livedns_domain.theorangeonenet.id
  name = "${each.value}._report._dmarc"
  type = "TXT"
  ttl  = 3600
  values = [
    "v=DMARC1"
  ]
}

resource "gandi_livedns_record" "theorangeonenet_apex" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "@"
  type = "ALIAS"
  ttl  = 3600
  values = [
    gandi_livedns_record.sys_domain_walker.href
  ]
}

resource "gandi_livedns_record" "theorangeonenet_srv_matrix" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "_matrix._tcp"
  type = "SRV"
  ttl  = 3600
  values = [
    "10 0 8448 ${gandi_livedns_record.theorangeonenet_matrix.href}."
  ]
}

resource "gandi_livedns_record" "theorangeonenet_matrix" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "matrix"
  type = "CNAME"
  ttl  = 3600
  values = [
    gandi_livedns_record.sys_domain_pve.href
  ]
}

resource "gandi_livedns_record" "theorangeonenet_plausible" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "plausible"
  type = "CNAME"
  ttl  = 3600
  values = [
    gandi_livedns_record.sys_domain_walker.href
  ]
}

resource "gandi_livedns_record" "theorangeonenet_plausible_bare" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "elbisualp"
  type = "CNAME"
  ttl  = 3600
  values = [
    gandi_livedns_record.sys_domain_walker.href
  ]
}

resource "gandi_livedns_record" "theorangeonenet_notes" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "notes"
  type = "CNAME"
  ttl  = 3600
  values = [
    "realorangeone.github.io"
  ]
}

resource "gandi_livedns_record" "theorangeonenet_bin" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "bin"
  type = "CNAME"
  ttl  = 3600
  values = [
    gandi_livedns_record.sys_domain_pve.href
  ]
}

resource "gandi_livedns_record" "theorangeonenet_google_site_verification" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "@"
  type = "TXT"
  ttl  = 3600
  values = [
    "google-site-verification=IXY4iSBN_vOcM3cp_f-BgVvEI_shz1GzXuY_8dqY61o"
  ]
}

resource "gandi_livedns_record" "theorangeonenet_mailgun_spf" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "mg"
  type = "TXT"
  ttl  = 3600
  values = [
    "\"v=spf1 include:mailgun.org -all\""
  ]
}

resource "gandi_livedns_record" "theorangeonenet_mailgun_dkim" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "mta._domainkey.mg"
  type = "TXT"
  ttl  = 3600
  values = [
    "\"k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1Z/MHEzpbWm5EgMkyWb+Xkz44Xrzr4SA5i2u8M2H5yZ1PSb4DpGk3IAX+I05UWax02+WBW3CBb5wU9rH9flgxezBoCf/hiMS1Wjb9hKGIBa2jMCzpF+wa5fyqLkLoAJZF4bc/BJKyi/ET2c7+DAA/2KlWv/nv4MEjcUR4hNGLPEC9+6PhUp8z2PnUQLzPRWHpKc1oLrnROWaX3XxdDekCzwyOw7ygzZdThVevE+0CqXVOt5SUSUCnd2tjVbvblGi6DBiQY5Tl6+xLqkQHCRqks9187+EN4FdJXkjQodkFzzyiBH5cXVGiZLOhal4koEvxGirr596qM97bIXiJWArdQIDAQAB\""
  ]
}

resource "gandi_livedns_record" "theorangeonenet_mailgun_dmarc" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "_dmarc.mg"
  type = "TXT"
  ttl  = 3600
  values = [
    "\"v=DMARC1; p=quarantine; ruf=mailto:dmarc-report@jakehoward.tech;\""
  ]
}

resource "gandi_livedns_record" "theorangeonenet_mastodon" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "mastodon"
  type = "CNAME"
  ttl  = 3600
  values = [
    gandi_livedns_record.sys_domain_pve.href
  ]
}

resource "gandi_livedns_record" "theorangeonenet_comentario" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "comentario"
  type = "CNAME"
  ttl  = 3600
  values = [
    gandi_livedns_record.sys_domain_walker.href
  ]
}

resource "gandi_livedns_record" "theorangeonenet_caa" {
  zone = gandi_livedns_domain.theorangeonenet.id
  name = "@"
  type = "CAA"
  ttl  = 3600
  values = [
    "0 issue \"letsencrypt.org\"",
    "0 wildissue \"letsencrypt.org\"",
  ]
}
