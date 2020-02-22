provider "vultr" {
  api_key     = var.vultr_api_key
  rate_limit  = 700
  retry_limit = 3
}

provider "cloudflare" {
  email   = "hosting+cloudflare@theorangeone.net"
  api_key = var.cloudflare_api_key
}

provider "aws" {
  region = "eu-west-2"
}
