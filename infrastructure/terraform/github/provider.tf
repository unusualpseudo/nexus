
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.3"
    }
    sops = {
      source  = "carlpett/sops"
      version = "1.0.0"
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
