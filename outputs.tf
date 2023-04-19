output "name" {
  value       = local.name
  description = "string ||| The name of the created domain."
}

output "fqdn" {
  value       = local.fqdn
  description = "string ||| The FQDN (fully-qualified domain name) for the created domain."
}

output "zone_id" {
  value       = local.zone_id
  description = "string |||  Google DNS Managed Zone ID (format projects/{{project}}/managedZones/{{name}})."
}

output "nameservers" {
  value       = local.nameservers
  description = "list(string) ||| List of Nameservers for Google DNS Managed Zone."
}
