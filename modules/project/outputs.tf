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

output "policy_set" {
  description = "The ID of the policy set configured."
  value       = one(tfe_project_policy_set.this[*].policy_set_id)
}

output "variable_set" {
  description = "The ID of the variable set configured."
  value       = one(tfe_project_variable_set.this[*].variable_set_id)
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
