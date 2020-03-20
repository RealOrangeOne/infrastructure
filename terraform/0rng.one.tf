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
