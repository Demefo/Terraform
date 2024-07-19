output "vm_ip_address" {
  value = azurerm_network_interface.terraform.private_ip_addresses[0]

}

output "public_ip_address" {
  description = "The public IP address of the created VM"
  value       = azurerm_public_ip.terraform.ip_address
}

# Add other outputs as needed
