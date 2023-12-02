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
  access_key = ""
  secret_key = ""
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