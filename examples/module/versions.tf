terraform {
  required_version = "~> 1.16"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.74, >= 0.74.1"
    }
  }
}
