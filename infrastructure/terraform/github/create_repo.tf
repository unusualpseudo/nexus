
resource "github_repository" "repo" {
  name               = var.repo_name
  description        = var.description
  visibility         = var.visibility
  archive_on_destroy = var.archive_on_destroy
  license_template   = var.license_template
  topics             = var.topics
  auto_init          = var.auto_init
  has_issues         = var.has_issues
  has_discussions    = var.has_discussions
  allow_auto_merge   = var.allow_auto_merge
  allow_merge_commit = var.allow_merge_commit
  allow_squash_merge = var.allow_squash_merge
  allow_rebase_merge = var.allow_rebase_merge
}



resource "github_branch_default" "main" {
  repository = github_repository.repo.name
  branch     = "main"
  depends_on = [
    github_repository.repo
  ]
}
