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
  default     = "terraform-practice"
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
