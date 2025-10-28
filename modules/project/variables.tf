variable "organization" {
  description = "(Optional) A name of the organization. If omitted, organization must be defined in the provider config."
  type        = string
  default     = null
  nullable    = true
}

variable "name" {
  description = "(Required) The name of the project."
  type        = string
  nullable    = false
}

variable "description" {
  description = "(Optional) A description to help you identify the project."
  type        = string
  default     = "Managed by Terraform."
  nullable    = false
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
  (Optional) A configurations for team access to the project. Each item of `team_access` block as defined below.
    (Required) `team` - The ID of the team to grant access to the project.
    (Optional) `role` - The role to assign to the team for the project. Valid values are `READ`, `WRITE`, `MAINTAIN`, `ADMIN`, or `CUSTOM`. Defaults to `READ`.
      `READ` - Can view everything in the project
      `WRITE` - Can update everything in the project
      `MAINTAIN` - Full control of everything in the project, but not the project itself
      `ADMIN` - Full control of the project
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
      contains(["READ", "WRITE", "MAINTAIN", "ADMIN", "CUSTOM"], access.role)
    ])
    error_message = "Valid values for `role` are `READ`, `WRITE`, `MAINTAIN`, `ADMIN`, or `CUSTOM`."
  }
}
