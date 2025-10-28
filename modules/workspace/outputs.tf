output "id" {
  description = "The ID of the workspace."
  value       = tfe_workspace.this.id
}

output "organization" {
  description = "The name of the organization."
  value       = tfe_workspace.this.organization
}

output "project" {
  description = "The project which the workspace belongs to."
  value = {
    id = tfe_workspace.this.project_id
  }
}

output "name" {
  description = "The name of the workspace."
  value       = tfe_workspace.this.name
}

output "description" {
  description = "The description of the workspace."
  value       = tfe_workspace.this.description
}

output "url" {
  description = "The URL to the browsable HTML overview of the workspace."
  value       = tfe_workspace.this.html_url
}

output "execution_mode" {
  description = "The execution mode for the workspace."
  value       = tfe_workspace_settings.this.execution_mode
}

output "policy_set" {
  description = "The ID of the policy set configured."
  value       = one(tfe_workspace_policy_set.this[*].policy_set_id)
}

output "variable_set" {
  description = "The ID of the variable set configured."
  value       = one(tfe_workspace_variable_set.this[*].variable_set_id)
}

output "statistics" {
  description = "The statistics of the workspace."
  value = {
    resource_count = tfe_workspace.this.resource_count
  }
}

output "team_access" {
  description = "The team access configurations for the workspace."
  value = [
    for access in tfe_team_access.this : {
      team = {
        id   = access.team_id
        name = local.team_names[access.team_id]
      }
      role = upper(access.access)
    }
  ]
}

# output "debug" {
#   value = {
#     for k, v in tfe_workspace.this :
#     k => v
#     if !contains(["name", "id", "organization", "description", "resource_count", "html_url", "project_id"], k)
#   }
# }

# output "debug2" {
#   value = tfe_workspace_policy_set.this
# }
#
# output "debug3" {
#   value = tfe_workspace_variable_set.this
# }
