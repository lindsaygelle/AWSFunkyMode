resource "aws_s3_bucket_analytics_configuration" "main" {
  bucket = aws_s3_bucket.main.bucket
  name   = aws_s3_bucket.main.bucket
  storage_class_analysis {
    data_export {
      destination {
        s3_bucket_destination {
          bucket_account_id = var.account
          bucket_arn        = aws_s3_bucket.log.arn
          prefix            = "analytics/${aws_s3_bucket.main.bucket}"
        }
      }
    }
  }
}

resource "aws_s3_bucket_analytics_configuration" "website" {
  bucket = aws_s3_bucket.website.bucket
  name   = aws_s3_bucket.website.bucket
  storage_class_analysis {
    data_export {
      destination {
        s3_bucket_destination {
          bucket_account_id = var.account
          bucket_arn        = aws_s3_bucket.log.arn
          prefix            = "analytics/${aws_s3_bucket.website.bucket}"
        }
      }
    }
  }
}
