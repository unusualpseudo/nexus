
resource "github_actions_secret" "app_id_secret" {
  repository      = github_repository.repo.name
  secret_name     = "BOT_APP_ID"
  plaintext_value = data.sops_file.github.data["app_id"]
}

resource "github_actions_secret" "app_id_private_key" {
  repository      = github_repository.repo.name
  secret_name     = "BOT_APP_PRIVATE_KEY"
  plaintext_value = data.sops_file.github.data["app_private_key"]
}


resource "github_actions_secret" "aws_acess_key_id" {
  repository      = github_repository.repo.name
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = data.sops_file.github.data["aws_acess_key_id"]
}


resource "github_actions_secret" "aws_secret_access_key" {
  repository      = github_repository.repo.name
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = data.sops_file.github.data["aws_secret_access_key"]
}

resource "github_actions_secret" "aws_region" {
  repository      = github_repository.repo.name
  secret_name     = "AWS_REGION"
  plaintext_value = data.sops_file.github.data["aws_region"]
}
