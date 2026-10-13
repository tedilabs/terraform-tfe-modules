mock_provider "tfe" {}

variables {
  organization    = "example"
  name            = "network"
  module_provider = "aws"

  telemetry = {
    enabled = false
  }
}

run "private_api" {
  command = plan

  assert {
    condition = (
      tfe_registry_module.this.registry_name == "private" &&
      length(tfe_registry_module.this.vcs_repo) == 0 &&
      output.registry_type == "PRIVATE"
    )
    error_message = "Private API-based modules must not configure a VCS repository."
  }
}

run "public" {
  command = plan

  variables {
    registry_type = "PUBLIC"
    namespace     = "terraform-aws-modules"
  }

  assert {
    condition = (
      tfe_registry_module.this.registry_name == "public" &&
      output.namespace == "terraform-aws-modules" &&
      output.registry_type == "PUBLIC"
    )
    error_message = "Public modules must retain their upstream namespace."
  }
}

run "monorepo_tags" {
  command = plan

  variables {
    vcs_repository = {
      identifier       = "example/terraform-aws-modules"
      oauth_token      = "ot-example"
      source_directory = "modules/network"
      tag_prefix       = "network-"
    }
  }

  assert {
    condition = (
      tfe_registry_module.this.vcs_repo[0].tags &&
      tfe_registry_module.this.vcs_repo[0].display_identifier == "example/terraform-aws-modules" &&
      tfe_registry_module.this.vcs_repo[0].source_directory == "modules/network" &&
      tfe_registry_module.this.vcs_repo[0].tag_prefix == "network-" &&
      tfe_registry_module.this.name == "network" &&
      tfe_registry_module.this.module_provider == "aws" &&
      !tfe_registry_module.this.test_config[0].tests_enabled
    )
    error_message = "Monorepo modules must preserve explicit identity and use tag-based publishing by default."
  }
}

run "branch_with_tests" {
  command = plan

  variables {
    vcs_repository = {
      identifier              = "example/terraform-aws-network"
      display_identifier      = "example/network"
      github_app_installation = "ghain-example"
      branch                  = "main"
    }
    initial_version = "1.0.0"
    tests_enabled   = true
  }

  assert {
    condition = (
      !tfe_registry_module.this.vcs_repo[0].tags &&
      tfe_registry_module.this.vcs_repo[0].branch == "main" &&
      tfe_registry_module.this.vcs_repo[0].display_identifier == "example/network" &&
      tfe_registry_module.this.vcs_repo[0].github_app_installation_id == "ghain-example" &&
      tfe_registry_module.this.test_config[0].tests_enabled &&
      tfe_registry_module.this.initial_version == "1.0.0"
    )
    error_message = "Branch-based modules must disable tag publishing and configure the initial version and tests."
  }
}

run "invalid_registry_type" {
  command = plan

  variables {
    registry_type = "public"
  }

  expect_failures = [var.registry_type]
}

run "public_without_namespace" {
  command = plan

  variables {
    registry_type = "PUBLIC"
  }

  expect_failures = [var.namespace]
}

run "private_with_namespace" {
  command = plan

  variables {
    namespace = "another-organization"
  }

  expect_failures = [var.namespace]
}

run "public_with_vcs" {
  command = plan

  variables {
    registry_type = "PUBLIC"
    namespace     = "terraform-aws-modules"
    vcs_repository = {
      identifier  = "example/terraform-aws-network"
      oauth_token = "ot-example"
    }
  }

  expect_failures = [var.vcs_repository]
}

run "vcs_without_authentication" {
  command = plan

  variables {
    vcs_repository = {
      identifier = "example/terraform-aws-network"
    }
  }

  expect_failures = [var.vcs_repository]
}

run "conflicting_authentication" {
  command = plan

  variables {
    vcs_repository = {
      identifier              = "example/terraform-aws-network"
      oauth_token             = "ot-example"
      github_app_installation = "ghain-example"
    }
  }

  expect_failures = [var.vcs_repository]
}

run "empty_branch" {
  command = plan

  variables {
    vcs_repository = {
      identifier  = "example/terraform-aws-network"
      oauth_token = "ot-example"
      branch      = ""
    }
  }

  expect_failures = [var.vcs_repository]
}

run "branch_with_tag_prefix" {
  command = plan

  variables {
    vcs_repository = {
      identifier  = "example/terraform-aws-network"
      oauth_token = "ot-example"
      branch      = "main"
      tag_prefix  = "network-"
    }
  }

  expect_failures = [var.vcs_repository]
}

run "tests_without_vcs" {
  command = plan

  variables {
    tests_enabled = true
  }

  expect_failures = [var.tests_enabled]
}

run "tests_with_tags" {
  command = plan

  variables {
    tests_enabled = true
    vcs_repository = {
      identifier  = "example/terraform-aws-network"
      oauth_token = "ot-example"
    }
  }

  expect_failures = [var.tests_enabled]
}

run "initial_version_without_branch" {
  command = plan

  variables {
    initial_version = "1.0.0"
  }

  expect_failures = [var.initial_version]
}
