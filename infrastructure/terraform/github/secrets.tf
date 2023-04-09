
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

resource "github_repository_deploy_key" "github-deploy-key" {
  repository = github_repository.repo.name
  title      = "github-deploy-key"
  key        = data.sops_file.github.data["github_deploy_key"]
  read_only  = true
}
