resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id
  depends_on = [
    aws_s3_bucket_public_access_block.website
  ]
  policy = data.aws_iam_policy_document.s3_bucket_policy_website.json
}
