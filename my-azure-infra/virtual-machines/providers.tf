provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }

    ansible = {
      version = "~> 1.0"
      source  = "ansible/ansible"
    }
  }
  cloud {
    organization = "jct-terratest"
    workspaces {
      name = "compute_resources"
    }
  }
}