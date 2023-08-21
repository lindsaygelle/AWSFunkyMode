// AppSync
resource "aws_iam_policy" "app_sync_full_access" {
  description = "Provides full access to all AppSync resources."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.app_sync_full_access.json
  name        = "${var.application}AppSyncFullAccess"
  tags_all    = local.tags_all
}

resource "aws_iam_policy" "app_sync_graphql_full_access" {
  description = "Provides full access to all AppSync GraphQL resources."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.app_sync_graphql_full_access.json
  name        = "${var.application}AppSyncGraphQLFullAccess"
  tags_all    = local.tags_all
}

// CloudWatch
resource "aws_iam_policy" "cloud_watch_logs_write_access" {
  description = "Allows applications to push logs to CloudWatch."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.cloud_watch_logs_write_access.json
  name        = "${var.application}PushToCloudWatchLogs"
  tags_all    = local.tags_all
}

// CognitoUserPools
resource "aws_iam_policy" "cognito_lambda_invoke_function" {
  description = "Provides ${aws_iam_role.cognito_lambda.name} invoke function access."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.cognito_lambda_invoke_function.json
  name        = "${var.application}CognitoLambdaInvokeFunction"
  tags_all    = local.tags_all
}

// DynamoDB
resource "aws_iam_policy" "dynamo_db_basic_access" {
  description = "Allows admin-like access to DynamoDB."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.dynamo_db_basic_access.json
  name        = "${var.application}DynamoDBBasicAccess"
  tags_all    = local.tags_all
}

resource "aws_iam_policy" "dynamo_db_stream_read_access" {
  description = "Provides read access to DynamoDB stream ${aws_dynamodb_table.main.stream_arn}."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.dynamo_db_stream_read_access.json
  name        = "${var.application}DynamoDBStreamReadOnlyAccess"
  tags_all    = local.tags_all
}

// MobileAnalytics
resource "aws_iam_policy" "mobile_analytics_full_access" {
  description = "Provides full access to all application resources."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.mobile_analytics_full_access.json
  name        = "${var.application}MobileAnalyticsFullAccess"
  tags_all    = local.tags_all
}
