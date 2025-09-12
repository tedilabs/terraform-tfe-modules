###################################################
# Project in Terraform Enterprise
###################################################

resource "tfe_project" "this" {
  organization = var.organization

  name        = var.name
  description = var.description

  tags                   = var.tags
  ignore_additional_tags = var.exclusive_tags_enabled
}


###################################################
# Policy Set for Project
###################################################

resource "tfe_project_policy_set" "this" {
  count = var.policy_set != null ? 1 : 0

  project_id    = tfe_project.this.id
  policy_set_id = var.policy_set
}


###################################################
# Variable Set for Project
###################################################

resource "tfe_project_variable_set" "this" {
  count = var.variable_set != null ? 1 : 0

  project_id      = tfe_project.this.id
  variable_set_id = var.variable_set
}
