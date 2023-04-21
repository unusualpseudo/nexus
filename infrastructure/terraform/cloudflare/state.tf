terraform {
  backend "s3" {
    bucket  = "nexus-terraform"
    region  = "eu-west-3"
    key     = "terraform/cloudflare"
    encrypt = true
  }
}
