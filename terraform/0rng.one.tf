resource "desec_domain" "orngone" {
  name = "0rng.one"
}

resource "desec_rrset" "orngone_apex" {
  domain  = desec_domain.orngone.name
  subname = ""
  type    = "A"
  records = gandi_livedns_record.sys_domain_walker.values
  ttl     = 3600
}

resource "desec_rrset" "orngone_apex_v6" {
  domain  = desec_domain.orngone.name
  subname = ""
  type    = "AAAA"
  records = gandi_livedns_record.sys_domain_walker_v6.values
  ttl     = 3600
}

resource "desec_rrset" "orngone_caa" {
  domain  = desec_domain.orngone.name
  subname = ""
  type    = "CAA"
  records = ["0 issue \"letsencrypt.org\""]
  ttl     = 3600
}

resource "desec_rrset" "orngone_who" {
  domain  = desec_domain.orngone.name
  subname = "who"
  type    = "CNAME"
  records = ["${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."]
  ttl     = 3600
}
