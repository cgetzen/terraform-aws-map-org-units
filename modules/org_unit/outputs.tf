output "ous" {
  value = data.aws_organizations_organizational_units.ous
}

output "ids" {
  value = local.ous
}
