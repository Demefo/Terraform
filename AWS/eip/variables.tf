variable "instance_id" {
  description = "The ID of the EC2 instance to associate with the Elastic IP"
  type        = string
}

variable "eip_name" {
  description = "The name tag for the Elastic IP"
  type        = string
  default     = "terraform-eip"
}
