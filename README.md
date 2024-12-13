# gcp-subdomain-from-aws

Nullstone module to create a GCP-managed subdomain using an AWS domain.

## Overview 

This module creates a DNS Zone on Google Cloud DNS.

By default, this module will create an SSL certificate using GCP Certificate Manager.
This can be disabled by setting the variable `disable_certificate = true`.
This certificate is created for Cloud CDNs and Load Balancing (most common use case).
A certificate and certificate map are created and emitted as outputs for use to attach to a GCP Load Balancer.

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
