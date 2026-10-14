output "private" {
  description = "The private registry module published through the API."
  value       = module.private
}

output "public" {
  description = "The existing public module added to the organization's registry."
  value       = module.public
}

output "monorepo" {
  description = "The tag-based registry module published from a monorepo."
  value       = module.monorepo
}

output "branch" {
  description = "The branch-based registry module with tests enabled."
  value       = module.branch
}
