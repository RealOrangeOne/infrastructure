resource "gandi_livedns_domain" "orngone" {
  name = "0rng.one"
}

resource "gandi_livedns_record" "orngone_git" {
  zone = gandi_livedns_domain.orngone.id
  name = "git"
  type = "CNAME"
  ttl  = 3600
  values = [
    cloudflare_record.theorangeonenet_git.hostname
  ]
}

resource "gandi_livedns_record" "orngone_who" {
  zone = gandi_livedns_domain.orngone.id
  name = "who"
  type = "CNAME"
  ttl  = 3600
  values = [
    cloudflare_record.theorangeonenet_whoami.hostname
  ]
}

resource "gandi_livedns_record" "orngone_img" {
  zone = gandi_livedns_domain.orngone.id
  name = "img"
  type = "CNAME"
  ttl  = 3600
  values = [
    cloudflare_record.theorangeonenet_img.hostname
  ]
}

resource "gandi_livedns_record" "orngone_apex" {
  zone = gandi_livedns_domain.orngone.id
  name = "@"
  type = "A"
  ttl  = 3600
  values = [
    linode_instance.casey.ip_address
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
