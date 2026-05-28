# ------------------------------------------------------------------
#  variable value defined

# icici_dev = "tfvardev"
# icici_uat = "tfvaruat"
# ------------------------------------------------------------------

# ------------------------------------------------------------------

#  -----------------------------------------------------------------
#   for each loop with list
# icici=["icici_dev","icici_uat","icici_cug","icici_prod"]
# ------------------------------------------------------------------
#   for each loop with map
# icici = {
#   icici_dev  = "westus"
#   icici_uat  = "westus"
#   icici_cug  = "westus"
#   icici_prod = "westus"

# }
# ------------------------------------------------------------------
icicimap = {
  dev = {
    name     = "icici_dev"
    location = "centralindia"
  }
  uat = {
    name     = "icici_uat"
    location = "centralus"
  }
  cug = {
    name     = "icici_cug"
    location = "centralindia"
  }
  prod = {
    name     = "icici_prod"
    location = "centralindia"
  }
}

storage_accounts = {
  dev = {
    name                     = "stgacctsdev"
    location                 = "centralindia"
    resource_group_name      = "icici_dev"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  uat = {
    name                     = "stgacctuat"
    location                 = "centralus"
    resource_group_name      = "icici_uat"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  cug = {
    name                     = "stgacctcug"
    location                 = "centralindia"
    resource_group_name      = "icici_cug"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  prod = {
    name                     = "stgacctprod"
    location                 = "centralindia"
    resource_group_name      = "icici_prod"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}