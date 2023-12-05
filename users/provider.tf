terraform {
  required_providers {
    aws = {                     # provider local name
      source  = "hashicorp/aws" # global and unique source address
      version = "~> 5.0"        # version constraint
    }
  }
}

# Configure the AWS Provider

provider "aws" {
  access_key = "AKIAVT5ILJZYHUECSKB4"
  secret_key = "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"
  region     = "us-east-1"

  # default_tags {
  #   tags = {
  #     Name        = "DevCloudGeek"
  #     Owner       = "Vivek Gupta"
  #     Environment = "Test"
  #     createdBy   = "Terraform"
  #   }
  # }
}