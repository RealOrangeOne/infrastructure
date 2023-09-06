data "grafana_synthetic_monitoring_probes" "main" {}

locals {
  global_probes = [
    data.grafana_synthetic_monitoring_probes.main.probes.Amsterdam,
    data.grafana_synthetic_monitoring_probes.main.probes.CapeTown,
    data.grafana_synthetic_monitoring_probes.main.probes.Frankfurt,
    data.grafana_synthetic_monitoring_probes.main.probes.London,
    data.grafana_synthetic_monitoring_probes.main.probes.Mumbai,
    data.grafana_synthetic_monitoring_probes.main.probes.NewYork,
    data.grafana_synthetic_monitoring_probes.main.probes.NorthCalifornia,
    data.grafana_synthetic_monitoring_probes.main.probes.Oregon,
    data.grafana_synthetic_monitoring_probes.main.probes.Paris,
    data.grafana_synthetic_monitoring_probes.main.probes.SaoPaulo,
    data.grafana_synthetic_monitoring_probes.main.probes.Seoul,
    data.grafana_synthetic_monitoring_probes.main.probes.Singapore,
    data.grafana_synthetic_monitoring_probes.main.probes.Sydney,
    data.grafana_synthetic_monitoring_probes.main.probes.Tokyo,
    data.grafana_synthetic_monitoring_probes.main.probes.Toronto
  ]
  partial_global_probes = [
    data.grafana_synthetic_monitoring_probes.main.probes.CapeTown,
    data.grafana_synthetic_monitoring_probes.main.probes.Frankfurt,
    data.grafana_synthetic_monitoring_probes.main.probes.London,
    data.grafana_synthetic_monitoring_probes.main.probes.Mumbai,
    data.grafana_synthetic_monitoring_probes.main.probes.NewYork,
    data.grafana_synthetic_monitoring_probes.main.probes.NorthCalifornia,
    data.grafana_synthetic_monitoring_probes.main.probes.SaoPaulo,
    data.grafana_synthetic_monitoring_probes.main.probes.Seoul,
    data.grafana_synthetic_monitoring_probes.main.probes.Singapore,
    data.grafana_synthetic_monitoring_probes.main.probes.Sydney,
    data.grafana_synthetic_monitoring_probes.main.probes.Toronto,
  ]
  all_probes = data.grafana_synthetic_monitoring_probes.main.probes.*
}

resource "grafana_synthetic_monitoring_check" "vps_ping" {
  for_each = {
    casey  = linode_instance.casey.ip_address
    walker = vultr_instance.walker.main_ip
    grimes = vultr_instance.grimes.main_ip
  }

  job               = "${each.key} v4"
  target            = each.value
  enabled           = true
  probes            = local.partial_global_probes
  alert_sensitivity = "medium"

  frequency = 120 * 1000 # 2 minutes

  settings {
    ping {
      ip_version = "V4"
    }
  }
}

resource "grafana_synthetic_monitoring_check" "vps_ping_v6" {
  for_each = {
    casey  = split("/", linode_instance.casey.ipv6)[0]
    walker = vultr_instance.walker.v6_main_ip
    grimes = vultr_instance.grimes.v6_main_ip
  }

  job               = "${each.key} v6"
  target            = each.value
  enabled           = true
  probes            = local.partial_global_probes
  alert_sensitivity = "medium"

  frequency = 120 * 1000 # 2 minutes

  settings {
    ping {
      ip_version = "V6"
    }
  }
}


resource "grafana_synthetic_monitoring_check" "personal_website" {
  job               = "Personal Website"
  target            = "https://theorangeone.net/.health/"
  enabled           = true
  probes            = local.global_probes
  alert_sensitivity = "high"
  timeout           = 5000 # 5 seconds

  frequency = 120 * 1000 # 2 minutes

  settings {
    http {
      ip_version = "Any"
      method     = "GET"
    }
  }
}


resource "grafana_synthetic_monitoring_check" "grafana" {
  job     = "Grafana"
  target  = "https://grafana.jakehoward.tech/api/health"
  enabled = true
  probes = [
    data.grafana_synthetic_monitoring_probes.main.probes.London
  ]
  alert_sensitivity = "high"

  frequency = 120 * 1000 # 2 minutes

  settings {
    http {
      ip_version = "Any"
      method     = "GET"
    }
  }
}


resource "grafana_synthetic_monitoring_check" "whoami" {
  job     = "Whoami"
  target  = "https://whoami.theorangeone.net"
  enabled = true
  probes = [
    data.grafana_synthetic_monitoring_probes.main.probes.London
  ]
  alert_sensitivity = "medium"

  frequency = 120 * 1000 # 2 minutes

  settings {
    http {
      ip_version = "Any"
      method     = "GET"
    }
  }
}
