
resource "github_branch_protection" "main" {

  repository_id = github_repository.repo.node_id

  pattern                 = "main"
  allows_deletions        = false
  allows_force_pushes     = true
  required_linear_history = true


  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
    require_last_push_approval = true
  }


  required_status_checks {
    strict = true
  }
}


resource "github_branch_protection" "dev" {

  repository_id = github_repository.repo.node_id

  pattern                 = "dev"
  allows_deletions        = false
  allows_force_pushes     = true
  required_linear_history = true

}
