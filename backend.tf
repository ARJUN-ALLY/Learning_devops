terraform {
  backend "s3" {
    bucket = "pranav-s3-bucket-terraform"
    key = "terraform.tfstate"
    region = "us-west-2"
  }
}