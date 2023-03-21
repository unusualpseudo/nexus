
data "sops_file" "fluxcd" {
  source_file = "fluxcd_secrets.sops.yaml"
  input_type  = "yaml"
}
