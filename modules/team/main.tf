###################################################
# Team in Terraform Enterprise
###################################################

resource "tfe_team" "this" {
  organization = var.organization

  name        = var.name
  visibility  = lower(var.visibility)
  sso_team_id = var.sso_team_id
}
