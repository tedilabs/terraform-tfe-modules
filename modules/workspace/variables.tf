variable "organization" {
  description = "(Optional) A name of the organization. If omitted, organization must be defined in the provider config."
  type        = string
  default     = null
  nullable    = true
}

variable "project" {
  description = "(Optional) The ID of the project where the workspace should be created."
  type        = string
  default     = null
  nullable    = true
}

variable "name" {
  description = "(Required) The name of the workspace."
  type        = string
  nullable    = false
}

variable "description" {
  description = "(Optional) A description to help you identify the workspace."
  type        = string
  default     = "Managed by Terraform."
  nullable    = false
}

variable "execution_mode" {
  description = <<EOF
  (Optional) The execution mode for the workspace. Valid values are `local`, `remote` or `agent`. When set to `local`, the workspace will be used for state storage only.
  NOTE: If you omit this attribute, the resource configures the workspace to use your organization's default execution mode (which in turn defaults to `remote`).
  EOF
  type        = string
  default     = null
  nullable    = true

  validation {
    condition = anytrue([
      var.execution_mode == null,
      var.execution_mode != null && contains(["local", "remote", "agent"], var.execution_mode),
    ])
    error_message = "Value for `execution_mode` must be one of `local`, `remote`, `agent`, or null."
  }
}

variable "policy_set" {
  description = <<EOF
  (Optional) The ID of the policy set to configure.
  EOF
  type        = string
  default     = null
  nullable    = true
}

variable "variable_set" {
  description = <<EOF
  (Optional) A name of the variable set to configure.
  EOF
  type        = string
  default     = null
  nullable    = true
}

variable "tags" {
  description = "(Optional) A map of tags to add to all resources."
  type        = map(string)
  default     = {}
  nullable    = false
}

variable "exclusive_tags_enabled" {
  description = "(Optional) Whether to explicitly ignore which are not defined by this module. Defaults to `true`."
  type        = bool
  default     = true
  nullable    = false
}

variable "team_access" {
  description = <<EOF
  (Optional) A configurations for team access to the workspace. Each item of `team_access` block as defined below.
    (Required) `team` - The ID of the team to grant access to the workspace.
    (Optional) `role` - The role to assign to the team for the workspace. Valid values are `READ`, `PLAN`, `WRITE`, `ADMIN`, or `CUSTOM`. Defaults to `READ`.
      `READ` - Baseline permissions for reading a workspace
      `PLAN` - Read permissions plus the ability to create runs
      `WRITE` - Read, plan and write permissions
      `ADMIN` - Full control of the workspace
      `CUSTOM` - Create a custom permission set for this team
  EOF
  type = list(object({
    team = string
    role = optional(string, "READ")
  }))
  default  = []
  nullable = false

  validation {
    condition = alltrue([
      for access in var.team_access :
      contains(["READ", "PLAN", "WRITE", "ADMIN", "CUSTOM"], access.role)
    ])
    error_message = "Valid values for `role` are `READ`, `PLAN`, `WRITE`, `ADMIN`, or `CUSTOM`."
  }
}
