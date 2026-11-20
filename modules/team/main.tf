locals {
  metadata = {
    package = "terraform-tfe-modules"
    version = trimspace(file("${path.module}/../../VERSION"))
    module  = basename(path.module)
    name    = var.name
  }
}


###################################################
# Team in Terraform Enterprise
###################################################

resource "tfe_team" "this" {
  organization = var.organization

  name        = var.name
  visibility  = lower(var.visibility)
  sso_team_id = var.sso_team_id

  organization_access {
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
