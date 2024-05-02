# workspace

This module creates following resources.

- `tfe_workspace`
- `tfe_workspace_policy_set` (optional)
- `tfe_workspace_variable_set` (optional)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.53 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.54.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_workspace.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace_policy_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace_policy_set) | resource |
| [tfe_workspace_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace_variable_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the workspace. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description to help you identify the workspace. | `string` | `"Managed by Terraform."` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | (Optional) A name of the organization. If omitted, organization must be defined in the provider config. | `string` | `null` | no |
| <a name="input_policy_set"></a> [policy\_set](#input\_policy\_set) | (Optional) The ID of the policy set to configure. | `string` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | (Optional) The ID of the project where the workspace should be created. | `string` | `null` | no |
| <a name="input_variable_set"></a> [variable\_set](#input\_variable\_set) | (Optional) A name of the variable set to configure. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_description"></a> [description](#output\_description) | The description of the workspace. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the workspace. |
| <a name="output_name"></a> [name](#output\_name) | The name of the workspace. |
| <a name="output_organization"></a> [organization](#output\_organization) | The name of the organization. |
| <a name="output_project"></a> [project](#output\_project) | The project which the workspace belongs to. |
| <a name="output_statistics"></a> [statistics](#output\_statistics) | The statistics of the workspace. |
| <a name="output_url"></a> [url](#output\_url) | The URL to the browsable HTML overview of the workspace. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
