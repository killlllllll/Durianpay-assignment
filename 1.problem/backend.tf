 terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "durianpay121"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
} 