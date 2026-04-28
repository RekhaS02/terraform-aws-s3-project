resource "aws_s3_bucket" "bucket" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.bucket.id
  acl    = "public-read"
}

# The objects must wait for the ACL to be enabled
resource "aws_s3_object" "index" {
    bucket = aws_s3_bucket.bucket.id
    key = "index.html"
    source = "index.html"
    acl = "public-read"
    content_type = "text/html"
    depends_on = [aws_s3_bucket_acl.example]
}

resource "aws_s3_object" "error" {
    bucket = aws_s3_bucket.bucket.id
    key = "error.html"
    source = "error.html"
    acl = "public-read"
    content_type = "text/html"
    depends_on = [aws_s3_bucket_acl.example]
}

# The Website Configuration must also wait for the ACL/Public Access
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket.id
  
  index_document {
    suffix = "index.html"
  }
  
  error_document {
    key = "error.html"
  }

  depends_on = [ aws_s3_bucket_acl.example ]
}