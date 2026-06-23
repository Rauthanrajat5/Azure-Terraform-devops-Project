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

terraform {
  backend "azurerm" {
    resource_group_name  = "project-cicd-dev-rg"
    storage_account_name = "rajatstorage4021"
    container_name       = "container1"
    key                  = "terraform.tfstate"
  }
}
