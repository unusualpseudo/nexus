terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 4.5.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.2"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.10.0"
    }
    flux = {
      source  = "fluxcd/flux"
      version = ">= 0.0.13"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.1.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }

  }
  backend "s3" {
    bucket  = "nexus-terraform"
    region  = "eu-west-3"
    key     = "terraform/flux"
    encrypt = true
  }
}

provider "flux" {}

provider "kubectl" {}

provider "kubernetes" {
  config_path = var.KUBECONFIG
}

provider "github" {
  token = data.sops_file.fluxcd.data["github_token"]
  owner = data.sops_file.fluxcd.data["github_owner"]
}
