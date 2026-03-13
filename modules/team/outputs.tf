output "id" {
  description = "The ID of the team."
  value       = tfe_team.this.id
}

output "organization" {
  description = "The name of the organization."
  value       = tfe_team.this.organization
}

output "name" {
  description = "The name of the team."
  value       = tfe_team.this.name
}

output "visibility" {
  description = "The visibility of the team."
  value       = upper(tfe_team.this.visibility)
}

output "sso_team_id" {
  description = "The SSO team ID associated with the team."
  value       = tfe_team.this.sso_team_id
}

output "project_access" {
  description = "The level of access to projects within the organization."
  value       = var.project_access
}

output "workspace_access" {
  description = "The level of access to workspaces within the organization."
  value       = var.workspace_access
}

output "team_access" {
  description = "The level of access to teams within the organization."
  value       = var.team_access
}

# output "debug" {
#   value = {
#     for k, v in tfe_team.this :
#     k => v
#     if !contains(["name", "id", "organization", "description", "resource_count", "html_url", "project_id"], k)
#   }
# }
