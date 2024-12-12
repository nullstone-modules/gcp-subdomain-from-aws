module "cert" {
  source = "nullstone-modules/sslcert/gcp"

  enabled = !var.disable_certificate
  name    = local.resource_name
  labels  = local.labels
  scope   = ""

  subdomains = {
    (local.dns_name) = local.zone_id
  }
}

locals {
  certificate_id     = module.cert.certificate_id
  certificate_map_id = module.cert.certificate_map_id
}
