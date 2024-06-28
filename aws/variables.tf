# variable "region" {
#   description = "The AWS region to deploy the instance in"
#   type        = string
#   default     = "us-east-1"
# }

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
