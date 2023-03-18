
resource "github_repository_webhook" "discord" {
  repository = github_repository.repo.name
  active     = true
  configuration {
    url          = data.sops_file.github.data["discord_webhook_url"]
    content_type = "json"
  }
  events = ["*"]
}
