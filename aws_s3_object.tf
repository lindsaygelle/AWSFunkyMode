resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.website.id
  key    = "index.html"
  source = "./src/s3/website/index.html"
}

resource "aws_s3_object" "logout" {
  bucket = aws_s3_bucket.website.id
  key    = "logout.html"
  source = "./src/s3/website/logout.html"
}
