
resource "github_repository" "repo" {
  name               = var.repo_name
  description        = var.description
  visibility         = var.visibility
  archive_on_destroy = var.archive_on_destroy
  license_template   = var.license_template
  topics             = var.topics
  auto_init          = var.auto_init
}


resource "github_branch_default" "main" {
  repository = github_repository.repo.name
  branch     = "main"
  depends_on = [
    github_repository.repo
  ]
}

resource "github_branch" "dev" {
  branch        = "dev"
  source_branch = github_branch_default.main.branch
  repository    = github_repository.repo.name
  depends_on = [
    github_branch_default.main
  ]
}
