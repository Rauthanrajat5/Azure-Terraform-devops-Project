provider "azurerm" {
  features {}
  skip_provider_registration = true

}

terraform {
  required_providers {
    azurerm = {
      version = "3.74.0"
      source  = "hashicorp/azurerm"

    }
  }
}

