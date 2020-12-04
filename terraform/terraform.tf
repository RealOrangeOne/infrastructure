terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.11.0"
    }
    vultr = {
      source  = "vultr/vultr"
      version = "1.4.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.8.0"
    }
  }
}
