
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.18.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }
  }
}

# Configure Github provider
provider "github" {
  token = data.sops_file.github.data["token"]
  owner = data.sops_file.github.data["owner"]
}
