output "cloudflare_tunnel" {
  value     = cloudflare_tunnel.homelab
  sensitive = true
}

output "service_tokens" {
  value = tomap({
    for idx, token in cloudflare_access_service_token.token : idx =>
    {
      client_id     = token.client_id,
      client_secret = token.client_secret
    }
  })
  sensitive = true
}
