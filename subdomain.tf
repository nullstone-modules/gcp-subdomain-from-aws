data "ns_subdomain" "this" {
  stack_id = data.ns_workspace.this.stack_id
  block_id = data.ns_workspace.this.block_id
  env_id   = data.ns_workspace.this.env_id
}

locals {
  subdomain_part = data.ns_subdomain.this.subdomain_name
  fqdn           = data.ns_subdomain.this.fqdn

  // zone_id refers to google_dns_managed_zone.this.name; however, we need this variable to wait on the resource to be created
  // We're going to take google_dns_managed_zone.this.id and parse out the name (since id is computed during creation)
  // Format: projects/{{project}}/managedZones/{{name}}
  subdomain_zone_id = regex("^projects/[^/]+/managedZones/([^/]+)$", google_dns_managed_zone.this.id)[0]

  subdomain_name        = trimsuffix(google_dns_managed_zone.this.dns_name, ".")
  subdomain_nameservers = [for ns in google_dns_managed_zone.this.name_servers : trimsuffix(ns, ".")]
}
