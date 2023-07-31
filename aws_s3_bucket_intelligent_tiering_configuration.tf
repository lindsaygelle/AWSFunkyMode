resource "aws_s3_bucket_intelligent_tiering_configuration" "log" {
  bucket = aws_s3_bucket.log.id
  name = "archive"
  status = "Enabled"
  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days = 120
  }
  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days = 180
  }
}
