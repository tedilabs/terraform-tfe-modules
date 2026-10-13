# module

This module creates following resources.

- `tfe_registry_module`

Manage private modules published through the API or a VCS connection, or add existing public modules to an organization's HCP Terraform (Terraform Cloud) or Terraform Enterprise registry. This module does not upload module packages or publish new modules to the public Terraform Registry.

## Usage

See [examples/module](../../examples/module/) for API-based registration, public module integration, tag-based monorepo publishing, and branch-based publishing with tests.

- Configure provider authentication outside the module. Registry management requires a user token with the appropriate permissions or an owners team token; organization tokens are not supported.
- Supply `organization`, `name`, and `module_provider` explicitly. The provider requires these together, including when registering a module from a monorepo.
- Set `vcs_repository.branch` for branch-based publishing. Omit it for tag-based publishing; the module derives the provider's `tags` setting automatically.
- `source_directory` and `tag_prefix` require access to HCP Terraform's beta monorepo publishing feature. The minimum TFE provider version is `0.74.1`, which supports explicit module names and providers with VCS source directories.
- VCS connections and GitHub App installations must already exist. For API-based private modules, publish versions separately through the registry API.

See the [registry module resource documentation](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/registry_module) for service requirements.

## Tests

Run `terraform init` and `terraform test` from this directory. Tests use a mocked TFE provider and disable telemetry; no HCP Terraform credentials or live resources are required.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12 |
| <a name="requirement_telemetry"></a> [telemetry](#requirement\_telemetry) | >= 0.2.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.74.1 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | >= 0.74.1 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [tfe_registry_module.this](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/registry_module) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_module_provider"></a> [module\_provider](#input\_module\_provider) | (Required) The Terraform provider which the registry module is used for, such as `aws`. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the registry module. | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | (Required) The name of the organization which owns the registry module. | `string` | n/a | yes |
| <a name="input_initial_version"></a> [initial\_version](#input\_initial\_version) | (Optional) The initial version of a branch-based registry module. Requires `vcs_repository.branch`. If omitted, HCP Terraform uses `0.0.0`. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (Optional) The namespace of an existing public registry module. Required when `registry_type` is `PUBLIC`. Must be omitted for private modules, whose namespace is the organization name. | `string` | `null` | no |
| <a name="input_registry_type"></a> [registry\_type](#input\_registry\_type) | (Optional) The type of the registry module. Valid values are `PRIVATE` and `PUBLIC`. `PUBLIC` adds an existing public module to the organization's registry. Defaults to `PRIVATE`. | `string` | `"PRIVATE"` | no |
| <a name="input_telemetry"></a> [telemetry](#input\_telemetry) | (Optional) A configuration to collect telemetry data for the module. This is used to improve the module and its features. To send pseudonyms instead of identifying values such as the hostname and the Git remote, set `pseudonymization_enabled` to `true`. Pseudonyms are not anonymous; to keep data from being sent, disable its collector. The default configuration enables telemetry collection for machine, network, git, github, github actions, HCP Terraform, terraform, and toolchain. You can disable telemetry collection by setting `enabled` to `false`. `telemetry` block as defined below.<br/>    (Optional) `enabled` - Whether to enable telemetry collection. Default is `true`.<br/>    (Optional) `capture_machine` - Whether to capture machine information. Default is `true`.<br/>    (Optional) `capture_network` - Whether to capture network information. Default is `true`.<br/>    (Optional) `capture_git` - Whether to capture git information. Default is `true`.<br/>    (Optional) `capture_github` - Whether to capture GitHub information. Default is `true`.<br/>    (Optional) `capture_github_actions` - Whether to capture GitHub Actions information. Default is `true`.<br/>    (Optional) `capture_hcp_terraform` - Whether to capture HCP Terraform information. Default is `true`.<br/>    (Optional) `capture_terraform` - Whether to capture Terraform information. Default is `true`.<br/>    (Optional) `capture_toolchain` - Whether to capture toolchain information. Default is `true`.<br/>    (Optional) `pseudonymization_enabled` - Whether to enable pseudonymization of the captured data. Default is `false`. | <pre>object({<br/>    enabled = optional(bool, true)<br/><br/>    capture_machine        = optional(bool, true)<br/>    capture_network        = optional(bool, true)<br/>    capture_git            = optional(bool, true)<br/>    capture_github         = optional(bool, true)<br/>    capture_github_actions = optional(bool, true)<br/>    capture_hcp_terraform  = optional(bool, true)<br/>    capture_terraform      = optional(bool, true)<br/>    capture_toolchain      = optional(bool, true)<br/><br/>    pseudonymization_enabled = optional(bool, false)<br/>  })</pre> | `{}` | no |
| <a name="input_tests_enabled"></a> [tests\_enabled](#input\_tests\_enabled) | (Optional) Whether to run tests for the registry module. Only supported for branch-based publishing with `vcs_repository.branch`. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_vcs_repository"></a> [vcs\_repository](#input\_vcs\_repository) | (Optional) A configuration for the VCS repository of a private registry module. If omitted, module versions must be published through the API. `vcs_repository` block as defined below.<br/>    (Required) `identifier` - The repository identifier, usually in the format `<organization>/<repository>`. Azure DevOps uses `<organization>/<project>/_git/<repository>`.<br/>    (Optional) `display_identifier` - The display identifier of the repository. Defaults to `identifier`.<br/>    (Optional) `oauth_token` - The ID of an existing VCS OAuth connection token. Exactly one of `oauth_token` and `github_app_installation` is required.<br/>    (Optional) `github_app_installation` - The ID of an existing GitHub App installation. Conflicts with `oauth_token`.<br/>    (Optional) `branch` - The branch to publish module versions from. If omitted, versions are published from semantic version tags.<br/>    (Optional) `source_directory` - The path to the module within the repository. This is a beta feature which must be available to the organization.<br/>    (Optional) `tag_prefix` - The prefix to filter Git tags for a module in a monorepo. Only supported for tag-based publishing. This is a beta feature which must be available to the organization. | <pre>object({<br/>    identifier         = string<br/>    display_identifier = optional(string)<br/><br/>    oauth_token             = optional(string)<br/>    github_app_installation = optional(string)<br/><br/>    branch           = optional(string)<br/>    source_directory = optional(string)<br/>    tag_prefix       = optional(string)<br/>  })</pre> | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | The ID of the registry module. |
| <a name="output_module_provider"></a> [module\_provider](#output\_module\_provider) | The Terraform provider which the registry module is used for. |
| <a name="output_name"></a> [name](#output\_name) | The name of the registry module. |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | The namespace of the registry module. |
| <a name="output_organization"></a> [organization](#output\_organization) | The name of the organization. |
| <a name="output_publishing_mechanism"></a> [publishing\_mechanism](#output\_publishing\_mechanism) | The publishing mechanism used when releasing new versions of the registry module. |
| <a name="output_registry_type"></a> [registry\_type](#output\_registry\_type) | The type of the registry module. |
<!-- END_TF_DOCS -->
