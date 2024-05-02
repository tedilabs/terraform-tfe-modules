###################################################
# Workspace in Terraform Enterprise
###################################################

resource "tfe_workspace" "this" {
  organization = var.organization
  project_id   = var.project

  name        = var.name
  description = var.description
}


###################################################
# Policy Set for Workspace
###################################################

resource "tfe_workspace_policy_set" "this" {
  count = var.policy_set != null ? 1 : 0

  workspace_id  = tfe_workspace.this.id
  policy_set_id = var.policy_set
}


###################################################
# Variable Set for Workspace
###################################################

resource "tfe_workspace_variable_set" "this" {
  count = var.variable_set != null ? 1 : 0

  workspace_id    = tfe_workspace.this.id
  variable_set_id = var.variable_set
}
