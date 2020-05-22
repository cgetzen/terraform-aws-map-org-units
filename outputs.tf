output "ous" {
  value       = { for name, ou in local.ous : name => ou.id }
  description = "OU structure showing parents and children"
}

output "ids" {
  value       = local.ids
  description = "Map of OU names to ids"
}
