provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  cloud {
    organization = "jct-terratest"
    workspaces {
      name = "compute_resources"
    }
  }
}