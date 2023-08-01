resource "aws_s3_bucket_intelligent_tiering_configuration" "log" {
  bucket = aws_s3_bucket.log.id
  name   = aws_s3_bucket.log.bucket

  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days        = 125
  }
  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days        = 180
  }
}
