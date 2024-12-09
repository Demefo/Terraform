data "azurerm_resource_group" "terraform" {
  name = "terraform"
}

data "azurerm_virtual_network" "terraform" {
  name                = "tf-network"
  resource_group_name = data.azurerm_resource_group.terraform.name
}

data "azurerm_subnet" "terraform" {
  name                 = "tf-subnet"
  virtual_network_name = "tf-network"
  resource_group_name  = data.azurerm_resource_group.terraform.name
}