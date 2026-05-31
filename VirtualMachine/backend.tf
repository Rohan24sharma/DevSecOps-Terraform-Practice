terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend"
    storage_account_name = "statebackendstore"
    container_name       = "vmstatefile"
    key                  = "terraform.tfstate"
  }
}