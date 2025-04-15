provider "aws" {
  region = "eu-west-2"
}

provider "linode" {
  token = var.linode_personal_access_token
}

provider "gandi" {
  personal_access_token = var.gandi_personal_access_token
}

provider "b2" {
  application_key    = var.backblaze_application_key
  application_key_id = var.backblaze_application_key_id
}

provider "hcloud" {
  token = var.hetzner_token
}
