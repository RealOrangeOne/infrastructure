provider "vultr" {
  api_key     = var.vultr_api_key
  rate_limit  = 1500
  retry_limit = 5
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

provider "aws" {
  region = "eu-west-2"
}

provider "linode" {
  token = var.linode_personal_access_token
}

provider "gandi" {
  key = var.gandi_api_key
}

provider "grafana" {
  url             = "https://theorangeone.grafana.net"
  auth            = var.grafana_cloud_api_key
  sm_access_token = var.grafana_cloud_synthetic_monitoring_token
  sm_url          = "https://synthetic-monitoring-api-gb-south.grafana.net"
}

provider "b2" {
  application_key    = var.backblaze_application_key
  application_key_id = var.backblaze_application_key_id
}
