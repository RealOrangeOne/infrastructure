locals {
  dns_ttl_default = 60 * 60
}

variable "linode_personal_access_token" {
  sensitive = true
}

variable "backblaze_application_key" {
  sensitive = true
}

variable "backblaze_application_key_id" {
  sensitive = true
}

variable "hetzner_token" {
  sensitive = true
}

variable "desec_api_token" {
  sensitive = true
}
