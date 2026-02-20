terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
    linode = {
      source  = "linode/linode"
      version = "1.30.0"
    }
    b2 = {
      source  = "Backblaze/b2"
      version = "0.10.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.48.1"
    }
    desec = {
      source  = "Valodim/desec"
      version = "0.6.1"
    }
  }
}
