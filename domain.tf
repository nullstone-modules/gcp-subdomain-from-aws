data "ns_connection" "domain" {
  name     = "domain"
  contract = "domain/aws/route53"
}

provider "aws" {
  access_key = data.ns_connection.domain.outputs.delegator["access_key"]
  secret_key = data.ns_connection.domain.outputs.delegator["secret_key"]

  alias = "domain"
}

locals {
  domain_name        = data.ns_connection.domain.outputs.name
  domain_zone_id     = data.ns_connection.domain.outputs.zone_id
  domain_nameservers = data.ns_connection.domain.outputs.nameservers
}
