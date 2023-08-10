resource "aws_iam_policy" "app_sync_full_access" {
  description = "Provides full access to all AppSync resources."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.app_sync_full_access.json
  name        = "${var.application}AppSyncFullAccess"
  tags_all    = local.tags_all
}

resource "aws_iam_policy" "app_sync_push_to_cloudwatch_logs" {
  description = "Allows AppSync to push logs to CloudWatch."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.app_sync_push_to_cloudwatch_logs.json
  name        = "${var.application}AppSyncPushToCloudWatchLogs"
  tags_all    = local.tags_all
}

resource "aws_iam_policy" "dynamo_db_basic_access" {
  description = "Allows admin-like access to DynamoDB."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.dynamo_db_basic_access.json
  name        = "${var.application}DynamoDBBasicAccess"
  tags_all    = local.tags_all
}

resource "aws_iam_policy" "mobile_analytics_full_access" {
  description = "Provides full access to all application resources."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.mobile_analytics_full_access.json
  name        = "${var.application}MobileAnalyticsFullAccess"
  tags_all    = local.tags_all
}

resource "aws_iam_policy" "cognito_lambda_invoke_function" {
  description = "Provides ${aws_iam_role.cognito_lambda.name} invoke function access."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.cognito_lambda_invoke_function.json
  name        = "${var.application}CognitoLambdaInvokeFunction"
  tags_all    = local.tags_all
}
