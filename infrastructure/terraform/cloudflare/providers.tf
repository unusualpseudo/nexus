terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.2.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  backend "s3" {
    bucket  = "nexus-terraform"
    region  = "eu-west-3"
    key     = "terraform/cloudflare"
    encrypt = true
  }
}

provider "cloudflare" {
  email   = data.sops_file.cloudflare_secrets.data["cloudflare_email"]
  api_key = data.sops_file.cloudflare_secrets.data["cloudflare_api_key"]
}
