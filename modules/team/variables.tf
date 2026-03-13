variable "organization" {
  description = "(Optional) A name of the organization. If omitted, organization must be defined in the provider config."
  type        = string
  default     = null
  nullable    = true
}

variable "name" {
  description = "(Required) The name of the team."
  type        = string
  nullable    = false
}

variable "visibility" {
  description = <<EOF
  (Optional) A visibility of the team. Valid values are `ORGANIZATION` or `SECRET`. Defaults to `ORGANIZATION`.
    `ORGANIZATION` - Visible to every member of this organization.
    `SECRET` - Only visible to team members and organization owners.
  EOF
  type        = string
  default     = "ORGANIZATION"
  nullable    = false

  validation {
    condition     = contains(["ORGANIZATION", "SECRET"], var.visibility)
    error_message = "Value for `visibility` must be one of `ORGANIZATION` or `SECRET`."
  }
}

variable "sso_team_id" {
  description = "(Optional) The ID of the SSO team to link to this team."
  type        = string
  default     = null
  nullable    = true
}

variable "project_access" {
  description = <<EOF
  (Optional) The level of access to projects within the organization. Valid values are `NONE`, `READ`, or `MANAGE`. Defaults to `NONE`.
    `NONE` - No access to projects.
    `READ` - Allow members to view all projects within the organization.
    `MANAGE` - Allow members to create and administrate all projects within the organization.
  EOF
  type        = string
  default     = "NONE"
  nullable    = false

  validation {
    condition     = contains(["NONE", "READ", "MANAGE"], var.project_access)
    error_message = "Valid values for `project_access` are `NONE`, `READ`, or `MANAGE`."
  }
}

variable "workspace_access" {
  description = <<EOF
  (Optional) The level of access to workspaces within the organization. Valid values are `NONE`, `READ`, or `MANAGE`. Defaults to `NONE`.
    `NONE` - No access to workspaces.
    `READ` - Allow members to view all workspaces in this organization.
    `MANAGE` - Allow members to create and administrate all workspaces within the organization.
  EOF
  type        = string
  default     = "NONE"
  nullable    = false

  validation {
    condition     = contains(["NONE", "READ", "MANAGE"], var.workspace_access)
    error_message = "Valid values for `workspace_access` are `NONE`, `READ`, or `MANAGE`."
  }
}

variable "team_access" {
  description = <<EOF
  (Optional) The level of access to teams within the organization. Valid values are `NONE` or `MANAGE`. Defaults to `NONE`.
    `NONE` - No access to manage teams.
    `MANAGE` - Allow members to create, update, and delete teams.
  EOF
  type        = string
  default     = "NONE"
  nullable    = false

  validation {
    condition     = contains(["NONE", "MANAGE"], var.team_access)
    error_message = "Valid values for `team_access` are `NONE` or `MANAGE`."
  }
}

variable "exclusive_membership_management_enabled" {
  description = "(Optional) Whether to enable exclusive management for members of the team. This includes removal of team members which are not explicitly configured. Defaults to `false`."
  type        = bool
  default     = false
  nullable    = false
}

variable "members" {
  description = "(Optional) A set of Terraform Cloud user IDs to be members of the team."
  type        = set(string)
  default     = []
  nullable    = false
}
