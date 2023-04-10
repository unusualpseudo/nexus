resource "random_id" "tunnel-secret" {
  byte_length = 40
}

resource "cloudflare_tunnel" "homelab" {
  name       = "homelab"
  account_id = data.sops_file.cloudflare_secrets.data["cloudflare_account_id"]
  secret     = random_id.tunnel-secret.b64_std
}


resource "cloudflare_record" "wildcard" {
  zone_id = lookup(data.cloudflare_zones.domain.zones[0], "id")
  name    = "*"
  value   = cloudflare_tunnel.homelab.cname
  type    = "CNAME"
  proxied = true
}
