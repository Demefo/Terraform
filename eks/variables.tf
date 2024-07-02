variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "my-eks-cluster"
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.21"
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID for the EKS cluster"
  type        = string
}

variable "desired_capacity" {
  description = "The desired number of nodes in the node group"
  type        = number
  default     = 2
}

variable "max_capacity" {
  description = "The maximum number of nodes in the node group"
  type        = number
  default     = 3
}

variable "min_capacity" {
  description = "The minimum number of nodes in the node group"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "The instance type for the nodes"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "The name of the SSH key pair"
  type        = string
}

variable "cluster_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "The ARN of the IAM role for the EKS node group"
  type        = string
}

variable "disk_size" {
  description = "The disk size for the nodes"
  type        = number
  default     = 20
}
