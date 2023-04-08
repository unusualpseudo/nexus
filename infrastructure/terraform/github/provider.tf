
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.21.1"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }
  }
  backend "s3" {
    bucket  = "nexus-terraform"
    region  = "eu-west-3"
    key     = "terraform/github"
    encrypt = true
  }
}

# Configure Github provider
provider "github" {

  token = data.sops_file.github.data["token"]
  owner = data.sops_file.github.data["owner"]
}
