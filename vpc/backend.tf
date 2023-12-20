resource "aws_s3_bucket" "backend" {
  bucket = "devcloudgeek-state-backend"
  tags = {
    Name = "devcloudgeek-state-backend"
  }
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.backend.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_versioning" "backend_versioning" {
  bucket = aws_s3_bucket.backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform-lock" {
  name           = "terraform_state"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "DynamoDB Terraform State Lock Table"
  }
}

terraform {
  backend "s3" {
    bucket         = "devcloudgeek-state-backend"
    key            = "us-east-1/vpc/terrafrom-backend.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state"
    access_key     = "AKIAVT5ILJZYEUETAS3A"
    secret_key     = "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"
  }
}