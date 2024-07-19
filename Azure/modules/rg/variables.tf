# variable "admin_username" {
#   description = "Admin username for the VM"
#   type        = string
# }

# variable "ssh_public_key" {
#   description = "SSH public key path"
#   type        = string
# }

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "terraform"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "East US"
}

