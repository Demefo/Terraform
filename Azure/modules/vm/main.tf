
data "azurerm_resource_group" "terraform" {
  name = "terraform" # Replace with the actual resource group name
}

resource "azurerm_network_security_group" "terraform" {
  name                = "tf-nsg"
  location            = var.location
  resource_group_name = "my-resource-group"
}


resource "azurerm_virtual_network" "terraform" {
  name                = "tf-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.terraform.location
  resource_group_name = data.azurerm_resource_group.terraform.name
}

resource "azurerm_network_security_rule" "allow_ports" {
  count                       = 4
  name                        = "allow-port-${element(["http", "8080", "5000", "3000"], count.index)}"
  priority                    = 100 + count.index
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = element([80, 8080, 5000, 3000], count.index)
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_network_security_group.terraform.resource_group_name
  network_security_group_name = azurerm_network_security_group.terraform.name
}

resource "azurerm_subnet" "terraform" {
  name                 = "tf-subnet"
  resource_group_name  = data.azurerm_resource_group.terraform.name
  virtual_network_name = azurerm_virtual_network.terraform.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet_network_security_group_association" "terraform" {
  subnet_id                 = azurerm_subnet.terraform.id
  network_security_group_id = azurerm_network_security_group.terraform.id
}


resource "azurerm_public_ip" "terraform" {
  name                = "tf-publicip"
  location            = data.azurerm_resource_group.terraform.location
  resource_group_name = data.azurerm_resource_group.terraform.name
  allocation_method   = "Dynamic" # Choose "Static" or "Dynamic" as needed
}


resource "azurerm_network_interface" "terraform" {
  name                = "tf-nic"
  location            = data.azurerm_resource_group.terraform.location
  resource_group_name = data.azurerm_resource_group.terraform.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.terraform.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terraform.id
  }
}

resource "azurerm_virtual_machine" "terraform" {
  name                  = "jenkins-server"
  location              = data.azurerm_resource_group.terraform.location
  resource_group_name   = data.azurerm_resource_group.terraform.name
  network_interface_ids = [azurerm_network_interface.terraform.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "terraform-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "adminuser"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "dev"
    jenkins     = "server"
  }
}
