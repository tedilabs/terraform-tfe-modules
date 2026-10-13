# module

Examples of managing modules in an existing HCP Terraform organization:

- A private module whose versions are uploaded separately through the registry API.
- An existing public module added to the organization's registry.
- A private module published from `modules/vpc` in a monorepo using tags such as `vpc-1.0.0` and an OAuth connection.
- A private module published from the `main` branch through a GitHub App, with tests enabled.

Replace the example repository identifiers with your own repositories. Provide the existing organization, OAuth connection token ID, and GitHub App installation ID as Terraform variables. The monorepo example requires access to HCP Terraform's beta monorepo publishing feature; omit that module block if the feature is unavailable.

Authenticate the TFE provider using `TFE_TOKEN` or Terraform CLI credentials. Use a user token with registry management permissions or an owners team token, rather than an organization token.

```sh
terraform init
terraform plan \
  -var='organization=my-organization' \
  -var='oauth_token=ot-EXAMPLE' \
  -var='github_app_installation=ghain-EXAMPLE'
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.12 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.74, >= 0.74.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_branch"></a> [branch](#module\_branch) | ../../modules/module | n/a |
| <a name="module_monorepo"></a> [monorepo](#module\_monorepo) | ../../modules/module | n/a |
| <a name="module_private"></a> [private](#module\_private) | ../../modules/module | n/a |
| <a name="module_public"></a> [public](#module\_public) | ../../modules/module | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_github_app_installation"></a> [github\_app\_installation](#input\_github\_app\_installation) | The ID of an existing GitHub App installation with access to the branch-based repository. | `string` | n/a | yes |
| <a name="input_oauth_token"></a> [oauth\_token](#input\_oauth\_token) | The ID of an existing VCS OAuth connection token with access to the monorepo. | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | The name of an existing HCP Terraform organization. | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_branch"></a> [branch](#output\_branch) | The branch-based registry module with tests enabled. |
| <a name="output_monorepo"></a> [monorepo](#output\_monorepo) | The tag-based registry module published from a monorepo. |
| <a name="output_private"></a> [private](#output\_private) | The private registry module published through the API. |
| <a name="output_public"></a> [public](#output\_public) | The existing public module added to the organization's registry. |
<!-- END_TF_DOCS -->
