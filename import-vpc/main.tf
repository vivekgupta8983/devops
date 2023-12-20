terraform {
  required_providers {
    aws = {                     # provider local name
      source  = "hashicorp/aws" # global and unique source address
      version = "~> 5.0"        # version constraint
    }
  }
}



resource "aws_vpc" "name" {
  cidr_block                  = "192.168.0.0/16"
  enable_dns_support          = true
  enable_dns_hostnames        = false
  enable_network_address_usage_metrics = false
  instance_tenancy            = "default"

  tags = {
    "Environment" = "Test"
    "Name"        = "DevCloudGeek"
    "Owner"       = "Vivek Gupta"
    "createdBy"   = "Terraform"
  }
}
