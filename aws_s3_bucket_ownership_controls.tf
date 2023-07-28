resource "aws_s3_bucket_ownership_controls" "log" {
  bucket = aws_s3_bucket.log.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_ownership_controls" "main" {
  bucket = aws_s3_bucket.main.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_ownership_controls" "website" {
  bucket = aws_s3_bucket.website.id
  depends_on = [
    aws_s3_bucket_public_access_block.website
  ]
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
