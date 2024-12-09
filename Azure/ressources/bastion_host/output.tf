# outputs.tf

output "bastion_host_id" {
  description = "The ID of the Bastion Host"
  value       = azurerm_bastion_host.terraform.id
}

output "bastion_public_ip" {
  description = "The public IP address of the Bastion Host"
  value       = azurerm_public_ip.bastion.ip_address
}

output "bastion_subnet_id" {
  description = "The ID of the subnet where the Bastion Host is deployed"
  value       = azurerm_subnet.bastion.id
}
