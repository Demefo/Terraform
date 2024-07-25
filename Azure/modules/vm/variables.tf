# variable "admin_username" {
#   description = "Admin username for the VM"
#   type        = string
# }

variable "ssh_public_key" {
  description = "SSH public key path"
  type        = path
  default     = "~\\Downloads\terraform-practice.pem"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "East US"
}

variable "resource_group" {
  description = "The name of the resource group"
  type        = string
  default     = "terraform"
}

# Add other variables as needed
