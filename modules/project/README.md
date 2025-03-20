# project

This module creates following resources.

- `tfe_project`
- `tfe_project_policy_set` (optional)
- `tfe_project_variable_set` (optional)

<!-- BEGIN_TF_DOCS -->
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
| [tfe_project.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) | resource |
| [tfe_project_policy_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project_policy_set) | resource |
| [tfe_project_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project_variable_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the project. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description to help you identify the project. | `string` | `"Managed by Terraform."` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | (Optional) A name of the organization. If omitted, organization must be defined in the provider config. | `string` | `null` | no |
| <a name="input_policy_set"></a> [policy\_set](#input\_policy\_set) | (Optional) The ID of the policy set to configure. | `string` | `null` | no |
| <a name="input_variable_set"></a> [variable\_set](#input\_variable\_set) | (Optional) A name of the variable set to configure. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_description"></a> [description](#output\_description) | The description of the project. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the project. |
| <a name="output_name"></a> [name](#output\_name) | The name of the project. |
| <a name="output_organization"></a> [organization](#output\_organization) | The name of the organization. |
<!-- END_TF_DOCS -->
