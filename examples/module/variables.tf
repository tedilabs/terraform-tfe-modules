variable "organization" {
  description = "The name of an existing HCP Terraform organization."
  type        = string
  nullable    = false
}

variable "oauth_token" {
  description = "The ID of an existing VCS OAuth connection token with access to the monorepo."
  type        = string
  nullable    = false
}

variable "github_app_installation" {
  description = "The ID of an existing GitHub App installation with access to the branch-based repository."
  type        = string
  nullable    = false
}
