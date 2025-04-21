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
 
