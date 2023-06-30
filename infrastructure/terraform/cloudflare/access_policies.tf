resource "cloudflare_access_policy" "token" {
  for_each = {
    for app in local.apps : app.subdomain => app
    if app.access == "private"
  }

  zone_id        = lookup(data.cloudflare_zones.domain.zones[0], "id")
  application_id = cloudflare_access_application.apps[each.value.subdomain].id

  name       = "Allow service tokens"
  precedence = "5"
  decision   = "non_identity"

  include {
    service_token = [cloudflare_access_service_token.token[each.value.subdomain].id]
  }
}


resource "cloudflare_access_policy" "private" {
  for_each = {
    for app in local.apps : app.subdomain => app
    if app.access == "private"
  }

  zone_id        = lookup(data.cloudflare_zones.domain.zones[0], "id")
  application_id = cloudflare_access_application.apps[each.value.subdomain].id

  name       = "Allow admins"
  precedence = "10"
  decision   = "allow"

  include {
    group = [cloudflare_access_group.admins_group.id] # admins group
  }
}


resource "cloudflare_access_policy" "public" {
  for_each = {
    for app in local.apps : app.subdomain => app
    if app.access == "public"
  }
  zone_id        = lookup(data.cloudflare_zones.domain.zones[0], "id")
  application_id = cloudflare_access_application.apps[each.value.subdomain].id

  name       = "Allow everyone!"
  precedence = "15"
  decision   = "allow"

  include {
    everyone = true
  }
}
