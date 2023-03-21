variable "target_path" {
  description = "FluxCD target path in the repository"
  type        = string
}


variable "branch" {
  description = "Branch name where to install FluxCD"
  type        = string
}


variable "repository_name" {
  description = "Repository name"
  type        = string
}


variable "github_owner" {
  description = "Repository owner"
  type        = string
}


variable "KUBECONFIG" {
  description = "KUBECONFIG env variable"
  type        = string
}
