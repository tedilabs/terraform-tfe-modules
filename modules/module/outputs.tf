output "id" {
  description = "The ID of the registry module."
  value       = tfe_registry_module.this.id
}

output "organization" {
  description = "The name of the organization."
  value       = tfe_registry_module.this.organization
}

output "name" {
  description = "The name of the registry module."
  value       = tfe_registry_module.this.name
}

output "module_provider" {
  description = "The Terraform provider which the registry module is used for."
  value       = tfe_registry_module.this.module_provider
}

output "registry_type" {
  description = "The type of the registry module."
  value       = upper(tfe_registry_module.this.registry_name)
}

output "namespace" {
  description = "The namespace of the registry module."
  value       = tfe_registry_module.this.namespace
}

output "publishing_mechanism" {
  description = "The publishing mechanism used when releasing new versions of the registry module."
  value       = tfe_registry_module.this.publishing_mechanism
}
