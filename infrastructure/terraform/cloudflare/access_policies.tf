resource "cloudflare_access_policy" "admins_policy" {
  for_each = { for app in local.apps : app.subdomain => app }

  zone_id        = lookup(data.cloudflare_zones.domain.zones[0], "id")
  application_id = cloudflare_access_application.apps[each.value.subdomain].id

  name       = "allow admins"
  precedence = "10"
  decision   = "allow"

  include {
    group = [cloudflare_access_group.admins_group.id] # admins group
  }
}
