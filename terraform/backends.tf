terraform {
  backend "s3" {
    bucket = "0rng-terraform"
    key    = "terraform.tfstate"
    encrypt = true
    region = "eu-west-2"
  }
}
