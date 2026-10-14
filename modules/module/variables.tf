variable "organization" {
  description = "(Required) The name of the organization which owns the registry module."
  type        = string
  nullable    = false
}

variable "name" {
  description = "(Required) The name of the registry module."
  type        = string
  nullable    = false
}

variable "module_provider" {
  description = "(Required) The Terraform provider which the registry module is used for, such as `aws`."
  type        = string
  nullable    = false
}

variable "registry_type" {
  description = "(Optional) The type of the registry module. Valid values are `PRIVATE` and `PUBLIC`. `PUBLIC` adds an existing public module to the organization's registry. Defaults to `PRIVATE`."
  type        = string
  default     = "PRIVATE"
  nullable    = false

  validation {
    condition     = contains(["PRIVATE", "PUBLIC"], var.registry_type)
    error_message = "Valid values for `registry_type` are `PRIVATE` and `PUBLIC`."
  }
}

variable "namespace" {
  description = "(Optional) The namespace of an existing public registry module. Required when `registry_type` is `PUBLIC`. Must be omitted for private modules, whose namespace is the organization name."
  type        = string
  default     = null
  nullable    = true

  validation {
    condition     = var.registry_type == "PUBLIC" ? try(length(trimspace(var.namespace)) > 0, false) : var.namespace == null
    error_message = "Set `namespace` to a non-empty value for public modules and omit it for private modules."
  }
}

variable "vcs_repository" {
  description = <<EOF
  (Optional) A configuration for the VCS repository of a private registry module. If omitted, module versions must be published through the API. `vcs_repository` block as defined below.
    (Required) `identifier` - The repository identifier, usually in the format `<organization>/<repository>`. Azure DevOps uses `<organization>/<project>/_git/<repository>`.
    (Optional) `display_identifier` - The display identifier of the repository. Defaults to `identifier`.
    (Optional) `oauth_token` - The ID of an existing VCS OAuth connection token. Exactly one of `oauth_token` and `github_app_installation` is required.
    (Optional) `github_app_installation` - The ID of an existing GitHub App installation. Conflicts with `oauth_token`.
    (Optional) `branch` - The branch to publish module versions from. If omitted, versions are published from semantic version tags.
    (Optional) `source_directory` - The path to the module within the repository. This is a beta feature which must be available to the organization.
    (Optional) `tag_prefix` - The prefix to filter Git tags for a module in a monorepo. Only supported for tag-based publishing. This is a beta feature which must be available to the organization.
  EOF
  type = object({
    identifier         = string
    display_identifier = optional(string)

    oauth_token             = optional(string)
    github_app_installation = optional(string)

    branch           = optional(string)
    source_directory = optional(string)
    tag_prefix       = optional(string)
  })
  default  = null
  nullable = true

  validation {
    condition     = var.vcs_repository == null || var.registry_type == "PRIVATE"
    error_message = "`vcs_repository` is only supported for private registry modules."
  }

  validation {
    condition = var.vcs_repository == null ? true : (
      (var.vcs_repository.oauth_token != null) != (var.vcs_repository.github_app_installation != null)
    )
    error_message = "Exactly one of `vcs_repository.oauth_token` and `vcs_repository.github_app_installation` is required."
  }

  validation {
    condition = var.vcs_repository == null ? true : alltrue([
      for value in [var.vcs_repository.identifier, var.vcs_repository.oauth_token, var.vcs_repository.github_app_installation, var.vcs_repository.branch] :
      value == null ? true : length(trimspace(value)) > 0
    ])
    error_message = "The repository identifier, authentication IDs, and branch must not be empty when provided."
  }

  validation {
    condition     = var.vcs_repository == null ? true : var.vcs_repository.branch == null || var.vcs_repository.tag_prefix == null
    error_message = "`vcs_repository.tag_prefix` is only supported for tag-based publishing."
  }
}

variable "initial_version" {
  description = "(Optional) The initial version of a branch-based registry module. Requires `vcs_repository.branch`. If omitted, HCP Terraform uses `0.0.0`."
  type        = string
  default     = null
  nullable    = true

  validation {
    condition     = var.initial_version == null || try(var.vcs_repository.branch != null, false)
    error_message = "`initial_version` requires branch-based publishing with `vcs_repository.branch`."
  }
}

variable "tests_enabled" {
  description = "(Optional) Whether to run tests for the registry module. Only supported for branch-based publishing with `vcs_repository.branch`. Defaults to `false`."
  type        = bool
  default     = false
  nullable    = false

  validation {
    condition     = !var.tests_enabled || try(var.vcs_repository.branch != null, false)
    error_message = "`tests_enabled` requires branch-based publishing with `vcs_repository.branch`."
  }
}
