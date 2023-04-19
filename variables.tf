variable "create_vanity" {
  type        = bool
  description = <<EOF
Enable this to create vanity subdomain instead of environmental.
This is typically enabled on the production environment.

If dns-name is set to '.', create_vanity cannot be enabled.

EOF
  default     = false
}
