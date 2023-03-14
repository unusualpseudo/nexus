
resource "aws_s3_bucket" "terraform-state" {
  bucket = var.s3_bucket_name
  tags = {
    Name = "terraform"
  }

}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform-state.id
  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_s3_bucket_public_access_block" "access" {
  bucket                  = aws_s3_bucket.terraform-state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
