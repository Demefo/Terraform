
data "azurerm_resource_group" "terraform" {
  name = var.resource_group # Replace with the actual resource group name
}


data "azurerm_virtual_network" "terraform" {
  name                = "tf-vnet"
  resource_group_name = data.azurerm_resource_group.terraform.name
}

resource "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = data.azurerm_resource_group.terraform.name
  virtual_network_name = azurerm_virtual_network.terraform.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "bastion" {
  name                = "bastion-publicip"
  location            = data.azurerm_resource_group.terraform.location
  resource_group_name = data.azurerm_resource_group.terraform.name
  allocation_method   = "Dynamic" # Choose "Static" or "Dynamic" as needed
  sku                 = "Basic"
}


resource "azurerm_bastion_host" "terraform" {
  name                = "tf-bastion"
  location            = data.azurerm_resource_group.terraform.location
  resource_group_name = data.azurerm_resource_group.terraform.name

  ip_configuration {
    name                          = "configuration"
    subnet_id                     = azurerm_subnet.bastion.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bastion.id
  }
}
