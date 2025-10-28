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
