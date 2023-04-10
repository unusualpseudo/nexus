resource "cloudflare_access_group" "admins_group" {
  name    = "admins"
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  include {
    email = [data.sops_file.cloudflare_secrets.data["cloudflare_email"]]
  }
}
