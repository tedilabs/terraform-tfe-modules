# team

This module creates following resources.

- `tfe_team`
- `tfe_team_notification_configuration` (optional)
- `tfe_team_organization_member` (optional)
- `tfe_team_organization_members` (optional)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.68 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.70.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_team.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team) | resource |
| [tfe_team_organization_member.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_organization_member) | resource |
| [tfe_team_organization_members.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_organization_members) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the team. | `string` | n/a | yes |
| <a name="input_exclusive_membership_management_enabled"></a> [exclusive\_membership\_management\_enabled](#input\_exclusive\_membership\_management\_enabled) | (Optional) Whether to enable exclusive management for members of the team. This includes removal of team members which are not explicitly configured. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_members"></a> [members](#input\_members) | (Optional) A set of Terraform Cloud user IDs to be members of the team. | `set(string)` | `[]` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | (Optional) A name of the organization. If omitted, organization must be defined in the provider config. | `string` | `null` | no |
| <a name="input_project_access"></a> [project\_access](#input\_project\_access) | (Optional) The level of access to projects within the organization. Valid values are `NONE`, `READ`, or `MANAGE`. Defaults to `NONE`.<br/>    `NONE` - No access to projects.<br/>    `READ` - Allow members to view all projects within the organization.<br/>    `MANAGE` - Allow members to create and administrate all projects within the organization. | `string` | `"NONE"` | no |
| <a name="input_sso_team_id"></a> [sso\_team\_id](#input\_sso\_team\_id) | (Optional) The ID of the SSO team to link to this team. | `string` | `null` | no |
| <a name="input_team_access"></a> [team\_access](#input\_team\_access) | (Optional) The level of access to teams within the organization. Valid values are `NONE` or `MANAGE`. Defaults to `NONE`.<br/>    `NONE` - No access to manage teams.<br/>    `MANAGE` - Allow members to create, update, and delete teams. | `string` | `"NONE"` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | (Optional) A visibility of the team. Valid values are `ORGANIZATION` or `SECRET`. Defaults to `ORGANIZATION`.<br/>    `ORGANIZATION` - Visible to every member of this organization.<br/>    `SECRET` - Only visible to team members and organization owners. | `string` | `"ORGANIZATION"` | no |
| <a name="input_workspace_access"></a> [workspace\_access](#input\_workspace\_access) | (Optional) The level of access to workspaces within the organization. Valid values are `NONE`, `READ`, or `MANAGE`. Defaults to `NONE`.<br/>    `NONE` - No access to workspaces.<br/>    `READ` - Allow members to view all workspaces in this organization.<br/>    `MANAGE` - Allow members to create and administrate all workspaces within the organization. | `string` | `"NONE"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the team. |
| <a name="output_name"></a> [name](#output\_name) | The name of the team. |
| <a name="output_organization"></a> [organization](#output\_organization) | The name of the organization. |
| <a name="output_project_access"></a> [project\_access](#output\_project\_access) | The level of access to projects within the organization. |
| <a name="output_sso_team_id"></a> [sso\_team\_id](#output\_sso\_team\_id) | The SSO team ID associated with the team. |
| <a name="output_team_access"></a> [team\_access](#output\_team\_access) | The level of access to teams within the organization. |
| <a name="output_visibility"></a> [visibility](#output\_visibility) | The visibility of the team. |
| <a name="output_workspace_access"></a> [workspace\_access](#output\_workspace\_access) | The level of access to workspaces within the organization. |
<!-- END_TF_DOCS -->
