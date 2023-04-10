locals {
  apps = [
    {
      domain    = data.sops_file.cloudflare_secrets.data["cloudflare_domain"]
      subdomain = "homepage"
      type      = "self_hosted"
    },
    {
      domain    = data.sops_file.cloudflare_secrets.data["cloudflare_domain"]
      subdomain = "kubernetes"
      type      = "self_hosted"
    },
    {
      domain    = data.sops_file.cloudflare_secrets.data["cloudflare_domain"]
      subdomain = "goldilocks"
      type      = "self_hosted"
    },
    {
      domain    = data.sops_file.cloudflare_secrets.data["cloudflare_domain"]
      subdomain = "minio"
      type      = "self_hosted"
    },
    {
      domain    = data.sops_file.cloudflare_secrets.data["cloudflare_domain"]
      subdomain = "s3"
      type      = "self_hosted"
    },
    {
      domain    = data.sops_file.cloudflare_secrets.data["cloudflare_domain"]
      subdomain = "gitops"
      type      = "self_hosted"
    },
    {
      domain    = data.sops_file.cloudflare_secrets.data["cloudflare_domain"]
      subdomain = "status"
      type      = "self_hosted"
    }
  ]
}

resource "cloudflare_access_service_token" "token" {
  for_each             = { for app in local.apps : app.subdomain => app }
  account_id           = data.sops_file.cloudflare_secrets.data["cloudflare_account_id"]
  name                 = each.value.subdomain
  min_days_for_renewal = 30
  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_access_application" "apps" {
  for_each = { for app in local.apps : app.subdomain => app }

  zone_id                   = lookup(data.cloudflare_zones.domain.zones[0], "id")
  name                      = each.value.subdomain
  domain                    = "${each.value.subdomain}.${each.value.domain}"
  type                      = each.value.type
  session_duration          = "1h"
  auto_redirect_to_identity = false
}
