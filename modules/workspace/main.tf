###################################################
# Workspace in Terraform Enterprise
###################################################

resource "tfe_workspace" "this" {
  organization = var.organization
  project_id   = var.project

  name        = var.name
  description = var.description

  tags                   = var.tags
  ignore_additional_tags = var.exclusive_tags_enabled
}


###################################################
# Workspace Settings in Terraform Enterprise
###################################################

resource "tfe_workspace_settings" "this" {
  workspace_id = tfe_workspace.this.id

  execution_mode = var.execution_mode

  lifecycle {
    ignore_changes = [
      description,
      tags,
    ]
  }
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
