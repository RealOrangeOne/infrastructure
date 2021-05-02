resource "cloudflare_zone" "orngone" {
  zone = "0rng.one"
}

resource "cloudflare_record" "orngone_git" {
  zone_id = cloudflare_zone.orngone.id
  name    = "git"
  value   = cloudflare_record.theorangeonenet_git.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "orngone_who" {
  zone_id = cloudflare_zone.orngone.id
  name    = "who"
  value   = cloudflare_record.theorangeonenet_whoami.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "orngone_img" {
  zone_id = cloudflare_zone.orngone.id
  name    = "img"
  value   = cloudflare_record.theorangeonenet_img.hostname
  type    = "CNAME"
  ttl     = 1
}

resource "cloudflare_record" "orngone_yourls" {
  zone_id = cloudflare_zone.orngone.id
  name    = "@"
  value   = vultr_instance.casey.main_ip
  type    = "A"
  ttl     = 1
}
