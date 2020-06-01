data "aws_organizations_organization" "org" {}

locals {
  root_id = data.aws_organizations_organization.org.roots[0].id
}

data "aws_organizations_organizational_units" "ous_1" {
  for_each  = { "Root" : local.root_id }
  parent_id = each.value
}

module "ous2" {
  source  = "./modules/org_unit"
  enabled = var.depth >= 2
  ous     = data.aws_organizations_organizational_units.ous_1
}

module "ous3" {
  source  = "./modules/org_unit"
  enabled = var.depth >= 3
  ous     = module.ous2.ous
}

module "ous4" {
  source  = "./modules/org_unit"
  enabled = var.depth >= 4
  ous     = module.ous3.ous
}

module "ous5" {
  source  = "./modules/org_unit"
  enabled = var.depth >= 5
  ous     = module.ous4.ous
}

locals {
  accounts = { for account in data.aws_organizations_organization.org.accounts : account["name"] => account["id"] }
  ous      = merge({ "Root" : local.root_id }, module.ous2.ids, module.ous3.ids, module.ous4.ids, module.ous5.ids)
  roots    = { for root in data.aws_organizations_organization.org.roots : root["name"] => root["id"] }
}
