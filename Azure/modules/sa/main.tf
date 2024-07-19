resource "azurerm_storage_account" "terraform" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
}

resource "azurerm_storage_container" "terraform" {
  name                  = "tfcontainer"
  storage_account_name  = azurerm_storage_account.terraform.name
  container_access_type = "blob"
}
