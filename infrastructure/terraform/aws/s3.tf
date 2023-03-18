
resource "aws_s3_bucket" "terraform-state" {
  bucket = data.sops_file.aws_secrets.data["bucket_name"]
  tags = {
    Name = "terraform"
  }

}

resource "aws_s3_bucket_acl" "versioning_bucket_acl" {
  bucket = aws_s3_bucket.terraform-state.id
  acl    = "private"
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


resource "aws_s3_bucket_lifecycle_configuration" "terraform-bucket-lifecycle" {
  bucket = aws_s3_bucket.terraform-state.id

  rule {
    id = "versions-expiration"

    noncurrent_version_expiration {
      noncurrent_days           = 10
      newer_noncurrent_versions = 3
    }
    status = "Enabled"
  }

}
