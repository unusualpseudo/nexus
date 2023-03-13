
resource "cloudflare_filter" "countries" {
  zone_id     = lookup(data.cloudflare_zones.domain.zones[0], "id")
  description = "Expression to block all countries except FR"
  expression  = "(ip.geoip.country ne \"FR\")"
}

resource "cloudflare_firewall_rule" "countries" {
  zone_id     = lookup(data.cloudflare_zones.domain.zones[0], "id")
  description = "Firewall rule to block all countries except FR"
  filter_id   = cloudflare_filter.countries.id
  action      = "block"
}
