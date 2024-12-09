variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vault_name" {
  description = "Name of the key vault"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}
