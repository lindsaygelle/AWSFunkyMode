resource "aws_s3_bucket_acl" "main" {
  acl    = "private"
  bucket = aws_s3_bucket.main.id
}

resource "aws_s3_bucket_acl" "website" {
  acl        = "public-read"
  bucket     = aws_s3_bucket.website.id
  depends_on = [aws_s3_bucket_ownership_controls.website]
}
