terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0"
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
      version = "0.10.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.48.1"
    }
  }
}
