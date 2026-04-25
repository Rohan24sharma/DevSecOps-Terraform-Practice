terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.70.0"
    }
  }
  required_version = ">=1.1.0"
}

provider "azurerm" {
  # Configuration options
  features {

  }
}
resource "azurerm_resource_group" "rblock1" {
  name     = "rohan-rg1"
  location = "West US"
}

resource "azurerm_storage_account" "rblock2" {
  name                     = "rohanstgaccnt1"
  resource_group_name      = azurerm_resource_group.rblock1.name     #implicit dependency
  location                 = azurerm_resource_group.rblock1.location # implicit dependency
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}