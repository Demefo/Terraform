terraform {
  backend "s3" {
    bucket = "rudi-backend"
    key    = "azure/aks/terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = terraform-locks
  }
}
