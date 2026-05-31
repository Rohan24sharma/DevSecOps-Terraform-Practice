terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend" # resource grop for backend that will contain storage account
    storage_account_name = "statebackendstore" # storage account for storing container (fileshare,blob etc)
    container_name       = "vmstatefile" # container for storing state file
    key                  = "terraform.tfstate" # state file stored in container
  }
}