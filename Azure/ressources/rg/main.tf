resource "azurerm_resource_group" "terraform" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "terraform" {
  name                = "tf-network"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.terraform.name
  location            = var.location
}

resource "azurerm_subnet" "terraform" {
  name                 = "tf-subnet"
  resource_group_name  = azurerm_resource_group.terraform.name
  virtual_network_name = azurerm_virtual_network.terraform.name
  address_prefixes     = ["10.0.2.0/24"]
}
