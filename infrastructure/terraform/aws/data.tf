data "sops_file" "aws_secrets" {
  source_file = "aws_secrets.sops.yaml"
  input_type  = "yaml"
}
