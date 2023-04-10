
resource "cloudflare_filter" "countries" {
  zone_id     = lookup(data.cloudflare_zones.domain.zones[0], "id")
  description = "Expression to block all countries except..."
  expression  = "(ip.geoip.country ne \"${data.sops_file.cloudflare_secrets.data["country"]}\")"
}

resource "cloudflare_firewall_rule" "countries" {
  zone_id     = lookup(data.cloudflare_zones.domain.zones[0], "id")
  description = "Firewall rule to block all countries except..."
  filter_id   = cloudflare_filter.countries.id
  action      = "block"
}
