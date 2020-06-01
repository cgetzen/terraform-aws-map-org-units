output "accounts" {
  value       = local.accounts
  description = "Map of account names to ids"
}

output "ous" {
  value       = local.ous
  description = "Map of OU names to ids"
}

output "roots" {
  value       = local.roots
  description = "Map of root names to ids"
}
