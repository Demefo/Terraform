variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = "ruditfsa"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "terraform"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}
