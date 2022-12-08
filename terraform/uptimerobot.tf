resource "uptimerobot_monitor" "vps_ping" {
  for_each = {
    casey  = linode_instance.casey.ip_address
    walker = vultr_instance.walker.main_ip
    decker = linode_instance.decker.ip_address
    grimes = vultr_instance.grimes.main_ip
  }

  friendly_name = title(each.key)
  type          = "ping"
  url           = each.value
  interval      = 600
}

resource "uptimerobot_monitor" "website" {
  friendly_name = "Personal website"
  type          = "http"
  url           = "https://theorangeone.net/.health/"
  interval      = 300
}

resource "uptimerobot_monitor" "grafana" {
  friendly_name = "Grafana"
  type          = "http"
  url           = "https://grafana.jakehoward.tech/api/health"
  interval      = 300
}

resource "uptimerobot_monitor" "whoami" {
  friendly_name = "Whoami"
  type          = "http"
  url           = "https://whoami.theorangeone.net"
  interval      = 300
}

resource "uptimerobot_status_page" "main" {
  friendly_name = "TheOrangeOne"
  sort          = "a-z"
}
