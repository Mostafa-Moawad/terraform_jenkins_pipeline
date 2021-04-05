terraform {
  backend "s3" {
    bucket         = "terraform-backend-bucket-iti"
    key            = "iti/dev/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-backend-db"
  }
}