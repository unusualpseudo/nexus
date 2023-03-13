
resource "github_branch_protection" "main" {

  repository_id = github_repository.repo.node_id

  pattern                 = "main"
  enforce_admins          = true
  allows_deletions        = false
  allows_force_pushes     = false
  required_linear_history = true


  required_pull_request_reviews {
    dismiss_stale_reviews = true
    require_code_owner_reviews = true
    require_last_push_approval = true
  }

  required_status_checks {
    strict = true
  }
}
