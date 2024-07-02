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
