# workspace

This module creates following resources.

- `tfe_workspace`
- `tfe_workspace_settings`
- `tfe_workspace_policy_set` (optional)
- `tfe_workspace_variable_set` (optional)

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
| [tfe_workspace.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace_policy_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace_policy_set) | resource |
| [tfe_workspace_settings.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace_settings) | resource |
| [tfe_workspace_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace_variable_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the workspace. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description to help you identify the workspace. | `string` | `"Managed by Terraform."` | no |
| <a name="input_exclusive_tags_enabled"></a> [exclusive\_tags\_enabled](#input\_exclusive\_tags\_enabled) | (Optional) Whether to explicitly ignore which are not defined by this module. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_execution_mode"></a> [execution\_mode](#input\_execution\_mode) | (Optional) The execution mode for the workspace. Valid values are `local`, `remote` or `agent`. When set to `local`, the workspace will be used for state storage only.<br/>  NOTE: If you omit this attribute, the resource configures the workspace to use your organization's default execution mode (which in turn defaults to `remote`). | `string` | `null` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | (Optional) A name of the organization. If omitted, organization must be defined in the provider config. | `string` | `null` | no |
| <a name="input_policy_set"></a> [policy\_set](#input\_policy\_set) | (Optional) The ID of the policy set to configure. | `string` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | (Optional) The ID of the project where the workspace should be created. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_variable_set"></a> [variable\_set](#input\_variable\_set) | (Optional) A name of the variable set to configure. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_description"></a> [description](#output\_description) | The description of the workspace. |
| <a name="output_execution_mode"></a> [execution\_mode](#output\_execution\_mode) | The execution mode for the workspace. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the workspace. |
| <a name="output_name"></a> [name](#output\_name) | The name of the workspace. |
| <a name="output_organization"></a> [organization](#output\_organization) | The name of the organization. |
| <a name="output_policy_set"></a> [policy\_set](#output\_policy\_set) | The ID of the policy set configured. |
| <a name="output_project"></a> [project](#output\_project) | The project which the workspace belongs to. |
| <a name="output_statistics"></a> [statistics](#output\_statistics) | The statistics of the workspace. |
| <a name="output_url"></a> [url](#output\_url) | The URL to the browsable HTML overview of the workspace. |
| <a name="output_variable_set"></a> [variable\_set](#output\_variable\_set) | The ID of the variable set configured. |
<!-- END_TF_DOCS -->
