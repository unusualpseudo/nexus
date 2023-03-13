variable "description" {
  description = "A description of the repository"
  type        = string
  default     = "My home lab"
}

variable "default_branch_name" {
  description = "The default branch for the repo. Branch protection settings will be applied to the branch with this name. Currently defaults to `main`."
  type        = string
  default     = "main"
}

variable "visibility" {
  description = "Visibility of the repository. Repositories are created as private by default"
  type        = string
  default     = "public"
}

variable "repo_name" {
  description = "The name of the repository"
  type        = string
  default     = "nexus"
}

variable "archive_on_destroy" {
  type    = bool
  default = true
}

variable "license_template" {
  type    = string
  default = "mit"
}

variable "topics" {
  type    = list(any)
  default = ["k8s", "terraform", "cloudflare", "k3s", "home-lab", "ansible", "fluxcd"]
}

variable "auto_init" {
  type    = bool
  default = true
}
