resource "azurerm_resource_group" "terraform" {
  name     = var.resource_group_name
  location = var.location
}

# resource "azurerm_virtual_network" "example" {
#   name                = "example-network"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

# Add other resources (VM, subnet, etc.) here
