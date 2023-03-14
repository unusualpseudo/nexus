terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "local" {}
}


provider "aws" {
  profile = "default"
  region  = "eu-west-3"
}
