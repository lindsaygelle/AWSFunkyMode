resource "aws_s3_bucket_analytics_configuration" "log" {
  bucket = aws_s3_bucket.log.id
  name = "analytics"
  storage_class_analysis {
    data_export {
      destination {
        s3_bucket_destination {
          bucket_arn = aws_s3_bucket.log.arn
          prefix = "analytics/${aws_s3_bucket.log.bucket}"
        }
      }
    }
  }
}
resource "aws_s3_bucket_analytics_configuration" "main" {
  bucket = aws_s3_bucket.log.id
  name = "analytics"
  storage_class_analysis {
    data_export {
      destination {
        s3_bucket_destination {
          bucket_arn = aws_s3_bucket.log.arn
          prefix = "analytics/${aws_s3_bucket.main.bucket}"
        }
      }
    }
  }
}
