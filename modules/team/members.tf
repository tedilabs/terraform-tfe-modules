###################################################
# Members of Team
###################################################

resource "tfe_team_organization_members" "this" {
  count = var.exclusive_membership_management_enabled ? 1 : 0

  team_id                     = tfe_team.this.id
  organization_membership_ids = var.members
}

resource "tfe_team_organization_member" "this" {
  for_each = !var.exclusive_membership_management_enabled ? var.members : []

  team_id                    = tfe_team.this.id
  organization_membership_id = each.value
}
