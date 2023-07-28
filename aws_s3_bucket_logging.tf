resource "aws_s3_bucket_logging" "main" {
  bucket        = aws_s3_bucket.main.id
  target_bucket = aws_s3_bucket.log.id
  target_prefix = "log/${aws_s3_bucket.main.bucket}/"
}

resource "aws_s3_bucket_logging" "website" {
  bucket        = aws_s3_bucket.website.id
  target_bucket = aws_s3_bucket.log.id
  target_prefix = "log/${aws_s3_bucket.website.bucket}/"
}
