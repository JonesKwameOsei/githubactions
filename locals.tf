locals {
  name_prefix = format("%s-%s", var.name, "vpc")
  short_region = "euw2"
  resource_name = format("%s-%s", local.name_prefix, local.short_region)
  ssm_prefix = format("/s/s/s")
}