output "storage_account_id" {
  description = "ID of the created storage account"
  value       = azurerm_storage_account.terraform.id
}
