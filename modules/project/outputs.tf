output "id" {
  description = "The ID of the project."
  value       = tfe_project.this.id
}

output "organization" {
  description = "The name of the organization."
  value       = tfe_project.this.organization
}

output "name" {
  description = "The name of the project."
  value       = tfe_project.this.name
}

output "description" {
  description = "The description of the project."
  value       = tfe_project.this.description
}

# output "debug" {
#   value = {
#     for k, v in tfe_project.this :
#     k => v
#     if !contains(["name", "id", "organization", "description"], k)
#   }
# }

# output "debug2" {
#   value = tfe_project_policy_set.this
# }
#
# output "debug3" {
#   value = tfe_project_variable_set.this
# }
