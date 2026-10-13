provider "tfe" {
  organization = var.organization
}


###################################################
# Private Registry Module Published through the API
###################################################

module "private" {
  source = "../../modules/module"

  organization    = var.organization
  name            = "example"
  module_provider = "aws"
}


###################################################
# Public Registry Module
###################################################

module "public" {
  source = "../../modules/module"

  organization    = var.organization
  name            = "vpc"
  module_provider = "aws"
  registry_type   = "PUBLIC"
  namespace       = "terraform-aws-modules"
}


###################################################
# Tag-Based Registry Module from a Monorepo
###################################################

module "monorepo" {
  source = "../../modules/module"

  organization    = var.organization
  name            = "vpc"
  module_provider = "aws"

  # INFO: Monorepo publishing requires access to the HCP Terraform beta feature.
  vcs_repository = {
    identifier       = "example/terraform-aws-modules"
    oauth_token      = var.oauth_token
    source_directory = "modules/vpc"
    tag_prefix       = "vpc-"
  }
}


###################################################
# Branch-Based Registry Module with Tests
###################################################

module "branch" {
  source = "../../modules/module"

  organization    = var.organization
  name            = "network"
  module_provider = "aws"

  vcs_repository = {
    identifier              = "example/terraform-aws-network"
    github_app_installation = var.github_app_installation
    branch                  = "main"
  }

  initial_version = "1.0.0"
  tests_enabled   = true
}
