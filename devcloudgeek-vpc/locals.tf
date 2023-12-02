# the local values are declared in a single `locals` block
locals {
  owner = "DevOps Corp Team"
  project = "Online Store"
  cidr_blocks = ["172.16.10.0/24", "172.16.20.0/24", "172.16.30.0/24"]
  common-tags = {
      Name = "dev"
      Environment = "development"
      Version = 1.10
      created_time = timestamp()
  }
}

# Create a VPC.
resource "aws_vpc" "dev_vpc" {
  cidr_block = "172.16.0.0/16"
  tags = local.common-tags
} 

# Create a subnet in the VPC
resource "aws_subnet" "dev_subnets" {
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = local.cidr_blocks[0]
  availability_zone = "us-east-1a"

  tags = local.common-tags
}

# Create an Internet Gateway Resource
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id  
  tags = {
    "Name" = "${local.common-tags["Name"]}-igw"
    "Version" = "${local.common-tags["Version"]}"
  }
}