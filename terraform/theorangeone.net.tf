resource "cloudflare_zone" "theorangeonenet" {
  zone = "theorangeone.net"
}

resource "cloudflare_record" "theorangeonenet_git" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "git"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_go" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "go"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_stats" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "stats"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}

resource "cloudflare_record" "theorangeonenet_whoami" {
  zone_id = cloudflare_zone.theorangeonenet.id
  name    = "whoami"
  value   = vultr_server.casey.main_ip
  type    = "A"
  ttl     = 1
}
