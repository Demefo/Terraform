provider "azurerm" {
  subscription_id = 455a1d4a-4fec-40d1-8e37-8a082cb07a3d
  features {
    resource_group {
       prevent_deletion_if_contains_resources = false
    }
  }
}
