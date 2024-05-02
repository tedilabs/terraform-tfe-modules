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
