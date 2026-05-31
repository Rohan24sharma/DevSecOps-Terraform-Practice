terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.70.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "774ffe54-349b-4aca-91d3-c243e03ca988"
  tenant_id       = "f0f54dcd-c9b8-4748-86ef-bae32d3adde4"
}

