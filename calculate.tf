locals {
  // If a user specifies '.' for dns-name,
  //   we are going to use ${env}.${domain} as the fqdn instead of ${dns-name}.${env}.${domain}
  dns_name_chunk = local.subdomain_dns_name == "." ? "" : "${local.subdomain_dns_name}."

  // If user specifies var.create_vanity,
  //   we are going to drop ${env} from the fqdn
  env_chunk = var.create_vanity ? "" : "${local.env_name}."

  subdomain_chunk = "${local.dns_name_chunk}${local.env_chunk}"
  subdomain       = trimsuffix(local.subdomain_chunk, ".")
  fqdn            = "${local.subdomain_chunk}${local.domain_name}."

  // output locals
  dns_name    = trimsuffix(google_dns_managed_zone.this.dns_name, ".")
  zone_id     = google_dns_managed_zone.this.name
  nameservers = [for ns in google_dns_managed_zone.this.name_servers : trimsuffix(ns, ".")]
}
