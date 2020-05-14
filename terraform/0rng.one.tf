resource "cloudflare_zone" "orngone" {
  zone = "0rng.one"
}

resource "cloudflare_record" "orngone_git" {
  zone_id = cloudflare_zone.orngone.id
  name    = "git"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "orngone_who" {
  zone_id = cloudflare_zone.orngone.id
  name    = "who"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "orngone_img" {
  zone_id = cloudflare_zone.orngone.id
  name    = "img"
  value   = vultr_server.grimes.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "orngone_dl" {
  zone_id = cloudflare_zone.orngone.id
  name    = "dl"
  value   = vultr_server.grimes.main_ip
  type    = "A"
  ttl     = 1
}
