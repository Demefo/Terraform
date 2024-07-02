provider "aws" {
  region = var.region
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.dynamodb_table_name
  billing_mode = "PROVISIONED"
  read_capacity  = 3
  write_capacity = 3

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "terraform-locks"
  }
}

variable "region" {
  description = "The AWS region to deploy the DynamoDB table in"
  type        = string
  default     = "us-east-1"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "terraform-locks"
}
