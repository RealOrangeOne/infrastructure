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

resource "cloudflare_record" "orngone_website" {
  zone_id = cloudflare_zone.orngone.id
  name    = "the"
  value   = "theorangeone-net.netlify.com"
  type    = "CNAME"
  ttl     = 1
}
