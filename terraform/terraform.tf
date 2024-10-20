terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.27.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
    linode = {
      source  = "linode/linode"
      version = "1.30.0"
    }
    gandi = {
      source  = "go-gandi/gandi"
      version = "2.3.0"
    }
    b2 = {
      source  = "Backblaze/b2"
      version = "0.9.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.48.1"
    }
  }
}
