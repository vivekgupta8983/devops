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
  access_key = "AKIAVT5ILJZYEUETAS3A"
  secret_key = "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"
  region     = "us-east-1"

  default_tags {
    tags = {
      Name        = "DevCloudGeek"
      Owner       = "Vivek Gupta"
      Environment = "Test"
      createdBy   = "Terraform"
    }
  }
}