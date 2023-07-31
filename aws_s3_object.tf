resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.website.id
  content_type = "text/html"
  key          = "index.html"
  source       = "./src/cognito/user_pool/client/callback/index.html"
}

resource "aws_s3_object" "logout" {
  bucket       = aws_s3_bucket.website.id
  content_type = "text/html"
  key          = "logout.html"
  source       = "./src/cognito/user_pool/client/callback/logout.html"
}
