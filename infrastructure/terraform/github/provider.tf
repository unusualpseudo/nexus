
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.18.3"
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

provider "github" {
  token = data.sops_file.github.data["token"]
  owner = "unusualpseudo"
}
