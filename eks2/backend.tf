terraform {
  backend "s3" {
    bucket = "rudi-backend"
    key    = "eks2/terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = terraform-locks
  }
}
