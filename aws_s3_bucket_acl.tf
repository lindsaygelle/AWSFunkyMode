resource "aws_s3_bucket_acl" "log" {
  acl        = "log-delivery-write"
  bucket     = aws_s3_bucket.log.id
  depends_on = [aws_s3_bucket_ownership_controls.log]
}

resource "aws_s3_bucket_acl" "main" {
  acl        = "private"
  bucket     = aws_s3_bucket.main.id
  depends_on = [aws_s3_bucket_ownership_controls.main]
}

resource "aws_s3_bucket_acl" "website" {
  acl        = "public-read"
  bucket     = aws_s3_bucket.website.id
  depends_on = [aws_s3_bucket_ownership_controls.website]
}
