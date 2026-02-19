resource "desec_domain" "orngone" {
  name = "0rng.one"
}

resource "desec_rrset" "orngone_apex" {
  domain  = desec_domain.orngone.name
  subname = ""
  type    = "A"
  records = desec_rrset.sys_domain_walker.records
  ttl     = 3600
}

resource "desec_rrset" "orngone_apex_v6" {
  domain  = desec_domain.orngone.name
  subname = ""
  type    = "AAAA"
  records = desec_rrset.sys_domain_walker_v6.records
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
  records = ["${desec_rrset.sys_domain_pve.subname}.${desec_rrset.sys_domain_pve.domain}."]
  ttl     = 3600
}