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

// TODO: This policy isn't working as expected. There is still some stuff needed for S3/Cognito.
data "aws_iam_policy_document" "s3_bucket_policy_website" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    effect = "Allow"
    principals {
      identifiers = [
        aws_cognito_user_pool.main.arn
      ]
      type = "Federated"
    }
    resources = [
      "${aws_s3_bucket.website.arn}/*"
    ]
  }
}
