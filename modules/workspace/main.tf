data "tfe_teams" "this" {
  organization = var.organization
}

locals {
  team_names = zipmap(
    values(data.tfe_teams.this.ids),
    keys(data.tfe_teams.this.ids),
  )
}


###################################################
# Workspace in Terraform Enterprise
###################################################

# INFO: Not supported attributes
# INFO: Deprecated
# - `operations`
# INFO: Use a separate resource
# - `global_remote_state`
# - `remote_state_consumer_ids`
resource "tfe_workspace" "this" {
  organization = var.organization
  project_id   = var.project

  name        = var.name
  description = var.description

  queue_all_runs = var.queue_all_runs

  ssh_key_id = var.ssh_key

  tags                   = var.tags
  ignore_additional_tags = var.exclusive_tags_enabled

  lifecycle {
    ignore_changes = [
      global_remote_state,
      operations,
      remote_state_consumer_ids,
    ]
  }
}


###################################################
# Workspace Settings in Terraform Enterprise
###################################################

resource "tfe_workspace_settings" "this" {
  workspace_id = tfe_workspace.this.id

  execution_mode            = var.execution_mode
  global_remote_state       = var.global_remote_state
  remote_state_consumer_ids = var.remote_state_consumer_workspaces

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


###################################################
# Team Access for Workspace
###################################################

resource "tfe_team_access" "this" {
  for_each = {
    for access in var.team_access :
    access.team => access
  }

  workspace_id = tfe_workspace.this.id

  team_id = each.key
  access  = lower(each.value.role)
}
