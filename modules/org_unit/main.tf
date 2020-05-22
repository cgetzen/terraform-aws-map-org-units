locals {
  tmp = [for name, ou in var.ous : { for child in ou.children : child.name => child.id }]
  ous = var.enabled ? merge(flatten(list(local.tmp))...) : {}
}

data "aws_organizations_organizational_units" "ous" {
  for_each  = local.ous
  parent_id = each.value
}
