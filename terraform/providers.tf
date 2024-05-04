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

provider "b2" {
  application_key    = var.backblaze_application_key
  application_key_id = var.backblaze_application_key_id
}

provider "hcloud" {
  token = var.hetzner_token
}
