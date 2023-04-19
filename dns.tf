resource "google_dns_managed_zone" "this" {
  name     = local.block_ref
  dns_name = "${local.fqdn}."
  labels   = local.labels
}

resource "aws_route53_record" "this-delegation" {
  provider = aws.domain

  name    = local.subdomain
  zone_id = local.domain_zone_id
  type    = "NS"
  ttl     = 300
  records = google_dns_managed_zone.this.name_servers
}
