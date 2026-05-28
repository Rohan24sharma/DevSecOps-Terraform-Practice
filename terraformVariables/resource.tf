# resource "azurerm_resource_group" "rg_icici_dev" {
#   name     = var.icici_dev
#   location = "westus"
# }

# resource "azurerm_resource_group" "rg_icici_uat" {
#   name     = var.icici_uat
#   location = "westus"
# }

resource "azurerm_resource_group" "rg_icici" {
  for_each = var.icicimap
  name     = each.value.name
  location = each.value.location
}


