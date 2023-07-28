data "aws_iam_policy_document" "assume_role_cognito" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    effect = "Allow"
    principals {
      identifiers = [
        "cognito-idp.amazonaws.com"
      ]
      type = "Service"
    }
  }
}

data "aws_iam_policy_document" "mobile_analytics_full_access" {
  statement {
    actions = [
      "mobileanalytics:*"
    ]
    effect = "Allow"
    resources = [
      aws_pinpoint_app.main.arn
    ]
  }
}

data "aws_iam_policy_document" "s3_bucket_policy_website" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    effect = "Allow"
    principals {
      identifiers = [
        "*"
      ]
      type = "AWS"
    }
    resources = [
      "${aws_s3_bucket.website.arn}/*"
    ]
  }
}
