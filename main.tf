terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
 
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  force_destroy = true
  tags = {
    CreatedBy = "Backstage"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  count  = var.versioning ? 1 : 0
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
 
