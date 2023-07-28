resource "aws_s3_bucket" "main" {
  bucket = "${var.account}-${lower(var.application)}"
  tags = {
    access = "private"
  }
  tags_all = local.tags_all
}

resource "aws_s3_bucket" "website" {
  bucket = "${var.account}-${lower(var.application)}-site"
  tags = {
    access = "public"
  }
  tags_all = local.tags_all
}
