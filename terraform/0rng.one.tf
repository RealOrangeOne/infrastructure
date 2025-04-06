resource "gandi_livedns_domain" "orngone" {
  name = "0rng.one"
}

resource "gandi_livedns_record" "orngone_apex" {
  zone = gandi_livedns_domain.orngone.id
  name = "@"
  type = "ALIAS" # Gandi doesn't support CNAME-flattening
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."
  ]
}

resource "gandi_livedns_record" "orngone_caa" {
  zone = gandi_livedns_domain.orngone.id
  name = "@"
  type = "CAA"
  ttl  = 3600
  values = [
    "0 issue \"letsencrypt.org\""
  ]
}


resource "gandi_livedns_record" "orngone_who" {
  zone = gandi_livedns_domain.orngone.id
  name = "who"
  type = "CNAME"
  ttl  = 3600
  values = [
    "${gandi_livedns_record.sys_domain_pve.name}.${gandi_livedns_record.sys_domain_pve.zone}."
  ]
}
