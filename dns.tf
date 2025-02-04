resource "google_project_service" "dns" {
  service                    = "dns.googleapis.com"
  disable_dependent_services = false
  disable_on_destroy         = false
}

resource "google_dns_managed_zone" "this" {
  name     = local.resource_name
  dns_name = local.fqdn
  labels   = local.labels

  depends_on = [google_project_service.dns]
}

resource "aws_route53_record" "this-delegation" {
  provider = aws.domain

  name    = local.subdomain_part
  zone_id = local.domain_zone_id
  type    = "NS"
  ttl     = 300
  records = google_dns_managed_zone.this.name_servers
}
