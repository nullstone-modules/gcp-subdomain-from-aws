output "name" {
  value       = local.dns_name
  description = "string ||| The name of the created subdomain. (Format: '{{dns_name}}[.{{env}}].{{domain}}')"
}

output "fqdn" {
  value       = local.fqdn
  description = "string ||| The FQDN (fully-qualified domain name) for the created domain including the trailing '.'. (Format: '{{dns_name}}[.{{env}}].{{domain}}.')"
}

output "zone_id" {
  value       = local.zone_id
  description = "string |||  Google DNS Managed Zone ID (Format: projects/{{project}}/managedZones/{{name}})."
}

output "nameservers" {
  value       = local.nameservers
  description = "list(string) ||| List of Nameservers for Google DNS Managed Zone."
}

output "domain_name" {
  value       = local.domain_name
  description = "string ||| The full DNS name of the domain for this subdomain."
}
