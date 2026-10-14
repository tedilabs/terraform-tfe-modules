locals {
  metadata = {
    package = "terraform-tfe-modules"
    version = trimspace(file("${path.module}/../../VERSION"))
    module  = basename(path.module)
    name    = var.name
  }
}


###################################################
# Registry Module in Terraform Enterprise
###################################################

resource "tfe_registry_module" "this" {
  organization = var.organization

  name            = var.name
  module_provider = var.module_provider
  registry_name   = lower(var.registry_type)
  namespace       = var.namespace

  initial_version = var.initial_version

  dynamic "vcs_repo" {
    for_each = var.vcs_repository != null ? [var.vcs_repository] : []
    iterator = repository

    content {
      identifier         = repository.value.identifier
      display_identifier = coalesce(repository.value.display_identifier, repository.value.identifier)

      oauth_token_id             = repository.value.oauth_token
      github_app_installation_id = repository.value.github_app_installation

      branch           = repository.value.branch
      tags             = repository.value.branch == null
      source_directory = repository.value.source_directory
      tag_prefix       = repository.value.tag_prefix
    }
  }

  dynamic "test_config" {
    for_each = try(var.vcs_repository.branch, null) != null ? [var.vcs_repository] : []

    content {
      tests_enabled = var.tests_enabled
    }
  }
}
