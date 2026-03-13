locals {
  organization_access_enabled = anytrue([
    var.project_access != "NONE",
    var.workspace_access != "NONE",
    var.team_access != "NONE",
  ])
}


###################################################
# Team in Terraform Enterprise
###################################################

resource "tfe_team" "this" {
  organization = var.organization

  name        = var.name
  visibility  = lower(var.visibility)
  sso_team_id = var.sso_team_id

  dynamic "organization_access" {
    for_each = local.organization_access_enabled ? ["go"] : []

    content {
      read_workspaces = (var.project_access != "NONE"
        ? var.project_access == "READ"
        : var.workspace_access == "READ"
      )
      manage_workspaces = (var.project_access != "NONE"
        ? var.project_access == "MANAGE"
        : var.workspace_access == "MANAGE"
      )

      read_projects   = var.project_access == "READ"
      manage_projects = var.project_access == "MANAGE"

      manage_teams = var.team_access == "MANAGE"
    }
  }
}
