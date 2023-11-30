terraform {
 required_providers {
   aws = {                      # provider local name
     source  = "hashicorp/aws"  # global and unique source address
     version = "~> 5.0"         # version constraint
   }
 }
}

# Configure the AWS Provider

provider "aws" {
    access_key = "AKIAVT5ILJZYHUECSKB4"
    secret_key = "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"
    region = "us-east-1"

  default_tags {
    tags = {
      Environment = "Test"
      Name        = "DevCloudGeek"
      createdBy = "Terraform"
      created_at  = timestamp()
      owners = "Vivek Gupta"

    }
  }
}