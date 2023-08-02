resource "aws_s3_bucket" "log" {
  bucket   = "${var.account}-${lower(var.application)}-log"
  tags_all = local.tags_all
}

resource "aws_s3_bucket" "main" {
  bucket   = "${var.account}-${lower(var.application)}"
  tags_all = local.tags_all
}

resource "aws_s3_bucket" "website" {
  bucket   = "${var.account}-${lower(var.application)}-site"
  tags_all = local.tags_all
}
