variable "region" {
  description = "The AWS region to deploy the instance in"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair to use"
  type        = string
  default     = "terraform-aws"
}

variable "instance_name" {
  description = "The name tag for the instance"
  type        = string
  default     = "terraform-test"
}

variable "sg_name" {
  description = "The name of the security group"
  type        = string
  default     = "all_ports_open"
}

variable "sg_description" {
  description = "The description of the security group"
  type        = string
  default     = "Security group with all ports open"
}

variable "sg_ingress_cidr" {
  description = "The CIDR block for ingress rules"
  type        = string
  default     = "0.0.0.0/0"
}

variable "sg_egress_cidr" {
  description = "The CIDR block for egress rules"
  type        = string
  default     = "0.0.0.0/0"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "vpc_name" {
  description = "The name tag for the VPC"
  type        = string
  default     = "terraform-vpc"
}

variable "subnet_name" {
  description = "The name tag for the subnet"
  type        = string
  default     = "terraform-subnet"
}

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
