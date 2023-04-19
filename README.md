# gcp-subdomain-from-aws

Nullstone module to create a GCP-managed subdomain using an AWS domain.

## Overview 

This module creates a DNS Zone on Google Cloud DNS.

The `domain` connection refers to a Nullstone domain that is AWS-managed.
This module performs delegation -- it will add records to the root domain in AWS to direct the subdomain to newly-created GCP DNS Zone.
This allows a user to manage this subdomain fully in GCP without having access to the root domain in AWS.

## Subdomain Calculation

This modules adds the current Nullstone environment into the FQDN for the resulting subdomain.

Example:
  Domain:     `acme.com`
  Env:        `dev`
  `dns_name`: `api`
  FQDN:       `api.dev.acme.com`

If `var.create_vanity = true`, then the environment chunk is omitted from the FQDN.
The above example would become: `api.acme.com`.
This is used to create a production URL.
