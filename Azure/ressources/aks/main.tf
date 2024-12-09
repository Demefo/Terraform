resource "random_pet" "test" {
  length = 2
}

resource "azurerm_kubernetes_cluster" "system" {
  name                = "${random_pet.test.id}-aks"
  location            = data.azurerm_resource_group.terraform.location
  resource_group_name = data.azurerm_resource_group.terraform.name
  dns_prefix          = "${random_pet.test.id}-k8s"
  kubernetes_version  = "1.28.0"
  default_node_pool {
    name            = "system"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
    

    vnet_subnet_id      = data.azurerm_subnet.terraform.id
  }
  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control_enabled = true

  tags = {
    environment = "Dev"
  }

  linux_profile {
    admin_username = "adminuser"
    ssh_key {
      key_data = file("../vm/keys/vm-tf.pub")
    }
  }
  
  windows_profile {
    admin_username = "rudi"
    admin_password = "AdminPro@123456" #lenght 14 madatory
  }
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
  
}

resource "azurerm_kubernetes_cluster_node_pool" "second_pool" {
  kubernetes_cluster_id = azurerm_kubernetes_cluster.system.id
  name                  = "backpool"
  vm_size               = "Standard_D2_v2"
  orchestrator_version  = "1.28.0"
  enable_auto_scaling   = true
  vnet_subnet_id        = data.azurerm_subnet.terraform.id
  min_count             = 1
  max_count             = 3
  os_disk_size_gb       = 30
  zones                 = [1, 2]
  priority              = "Regular"
  mode                  = "User"  #indicates wether it is system or user 
  os_type               = "Linux" #you can add a linux_os_config
  node_labels = {
    "apps"        = "java"
    "environment" = "dev"
  }
  tags = {
    environment = "Dev"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "windows_pool" {
  kubernetes_cluster_id = azurerm_kubernetes_cluster.system.id
  name                  = "wpool"
  vm_size               = "Standard_D2_v2"
  orchestrator_version  = "1.28.0"
  enable_auto_scaling   = true
  zones                 = [1, 2]
  mode                  = "User"
  vnet_subnet_id        = data.azurerm_subnet.terraform.id
  os_disk_size_gb       = 30
  min_count = 1
  max_count = 3
  os_type   = "Windows"
  node_labels = {
    "apps"        = "dotnet"
    "environment" = "dev"
  }
  tags = {
    environment = "Dev"
  }
}
