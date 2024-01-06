terraform {
  backend "s3" {
    bucket  = "0rng-terraform"
    key     = "infrastructure/terraform.tfstate"
    encrypt = true
    region  = "eu-west-2"
  }
}
