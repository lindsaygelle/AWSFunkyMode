data "aws_iam_policy_document" "assume_role_api_gateway" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "assume_role_app_sync" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["appsync.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

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

data "aws_iam_policy_document" "assume_role_lambda" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "app_sync_full_access" {
  statement {
    actions = [
      "appsync:*"
    ]
    effect = "Allow"
    resources = [
      aws_appsync_graphql_api.main.arn
    ]
  }
}

data "aws_iam_policy_document" "app_sync_graphql_full_access" {
  statement {
    actions = [
      "appsync:GraphQL"
    ]
    effect = "Allow"
    resources = [
      aws_appsync_graphql_api.main.arn
    ]
  }
}

data "aws_iam_policy_document" "app_sync_push_to_cloudwatch_logs" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    effect = "Allow"
    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "cognito_lambda_invoke_function" {
  statement {
    actions = [
      "lambda:InvokeFunction"
    ]
    effect = "Allow"
    resources = [
      aws_lambda_function.cognito_user_pool_post_authentication.arn,
      aws_lambda_function.cognito_user_pool_post_sign_up.arn,
      aws_lambda_function.cognito_user_pool_pre_sign_up.arn
    ]
  }
}

data "aws_iam_policy_document" "dynamo_db_basic_access" {
  statement {
    actions = [
      "dynamodb:DeleteItem",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:UpdateItem"
    ]
    resources = [
      aws_dynamodb_table.main.arn,
      "${aws_dynamodb_table.main.arn}/*",
    ]
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
