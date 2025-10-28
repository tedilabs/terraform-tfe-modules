# project

This module creates following resources.

- `tfe_project`
- `tfe_project_policy_set` (optional)
- `tfe_project_variable_set` (optional)
- `tfe_team_project_access` (optional)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.68 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.68.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_project.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) | resource |
| [tfe_project_policy_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project_policy_set) | resource |
| [tfe_project_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project_variable_set) | resource |
| [tfe_team_project_access.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_project_access) | resource |
| [tfe_teams.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/teams) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the project. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description to help you identify the project. | `string` | `"Managed by Terraform."` | no |
| <a name="input_exclusive_tags_enabled"></a> [exclusive\_tags\_enabled](#input\_exclusive\_tags\_enabled) | (Optional) Whether to explicitly ignore which are not defined by this module. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | (Optional) A name of the organization. If omitted, organization must be defined in the provider config. | `string` | `null` | no |
| <a name="input_policy_set"></a> [policy\_set](#input\_policy\_set) | (Optional) The ID of the policy set to configure. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_team_access"></a> [team\_access](#input\_team\_access) | (Optional) A configurations for team access to the project. Each item of `team_access` block as defined below.<br/>    (Required) `team` - The ID of the team to grant access to the project.<br/>    (Optional) `role` - The role to assign to the team for the project. Valid values are `READ`, `WRITE`, `MAINTAIN`, `ADMIN`, or `CUSTOM`. Defaults to `READ`.<br/>      `READ` - Can view everything in the project<br/>      `WRITE` - Can update everything in the project<br/>      `MAINTAIN` - Full control of everything in the project, but not the project itself<br/>      `ADMIN` - Full control of the project<br/>      `CUSTOM` - Create a custom permission set for this team | <pre>list(object({<br/>    team = string<br/>    role = optional(string, "READ")<br/>  }))</pre> | `[]` | no |
| <a name="input_variable_set"></a> [variable\_set](#input\_variable\_set) | (Optional) A name of the variable set to configure. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_description"></a> [description](#output\_description) | The description of the project. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the project. |
| <a name="output_name"></a> [name](#output\_name) | The name of the project. |
| <a name="output_organization"></a> [organization](#output\_organization) | The name of the organization. |
| <a name="output_policy_set"></a> [policy\_set](#output\_policy\_set) | The ID of the policy set configured. |
| <a name="output_team_access"></a> [team\_access](#output\_team\_access) | The team access configurations for the project. |
| <a name="output_variable_set"></a> [variable\_set](#output\_variable\_set) | The ID of the variable set configured. |
<!-- END_TF_DOCS -->
