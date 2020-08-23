terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
    vultr = {
      source = "vultr/vultr"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
}
