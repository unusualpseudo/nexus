terraform {
  cloud {
    organization = "theunusuals"

    workspaces {
      name = "nexus"
    }
  }
}
