terraform {
  required_version = ">= 1.12"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.74.1"
    }
    telemetry = {
      source  = "tedilabs/telemetry"
      version = ">= 0.2.0"
    }
  }
}
