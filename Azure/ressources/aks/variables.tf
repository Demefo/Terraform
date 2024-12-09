variable "subscription_id" {
  type = string
}

variable "appId" {
  type        = string
  description = "AKS Cluster service principal"
}

variable "password" {
  type        = string
  description = "AKS Cluster password"
}
