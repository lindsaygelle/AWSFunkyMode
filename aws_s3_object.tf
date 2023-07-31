resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.website.id
  key    = "index.html"
  source = "./src/cognito/user_pool/client/callback/index.html"
}

resource "aws_s3_object" "logout" {
  bucket = aws_s3_bucket.website.id
  key    = "logout.html"
  source = "./src/cognito/user_pool/client/callback/logout.html"
}
