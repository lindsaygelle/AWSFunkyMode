// APIGateway
resource "aws_iam_role_policy_attachment" "api_gateway_app_sync_graphql_full_access" {
  policy_arn = aws_iam_policy.app_sync_graphql_full_access.arn
  role       = aws_iam_role.api_gateway.id
}

resource "aws_iam_role_policy_attachment" "api_gateway_lambda_basic_execution_role" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.api_gateway.id
}

resource "aws_iam_role_policy_attachment" "api_gateway_cloud_watch_logs_write_access" {
  policy_arn = aws_iam_policy.cloud_watch_logs_write_access.arn
  role       = aws_iam_role.api_gateway.id
}

resource "aws_iam_role_policy_attachment" "api_gateway_lambda_role" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaRole"
  role       = aws_iam_role.api_gateway.id
}

// AppSync
resource "aws_iam_role_policy_attachment" "app_sync_dynamo_db_basic_access" {
  policy_arn = aws_iam_policy.dynamo_db_basic_access.arn
  role       = aws_iam_role.app_sync.id
}

resource "aws_iam_role_policy_attachment" "app_sync_full_access" {
  policy_arn = aws_iam_policy.app_sync_full_access.arn
  role       = aws_iam_role.app_sync.id
}

resource "aws_iam_role_policy_attachment" "app_sync_cloud_watch_logs_write_access" {
  policy_arn = aws_iam_policy.cloud_watch_logs_write_access.arn
  role       = aws_iam_role.app_sync.id
}

resource "aws_iam_role_policy_attachment" "app_sync_lambda_cloud_watch_logs_write_access" {
  policy_arn = aws_iam_policy.cloud_watch_logs_write_access.arn
  role       = aws_iam_role.app_sync_lambda.id
}

// CognitoUserPools
resource "aws_iam_role_policy_attachment" "cognito_lambda_basic_execution_role" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole" // TODO
  role       = aws_iam_role.cognito_lambda.id
}

resource "aws_iam_role_policy_attachment" "cognito_lambda_cloud_watch_logs_write_access" {
  policy_arn = aws_iam_policy.cloud_watch_logs_write_access.arn
  role       = aws_iam_role.cognito_lambda.id
}

resource "aws_iam_role_policy_attachment" "cognito_lambda_invoke_function" {
  policy_arn = aws_iam_policy.cognito_lambda_invoke_function.arn
  role       = aws_iam_role.cognito_lambda.id
}

resource "aws_iam_role_policy_attachment" "cognito_mobile_analytics_full_access" {
  policy_arn = aws_iam_policy.mobile_analytics_full_access.arn
  role       = aws_iam_role.cognito.id
}

// DynamoDB
resource "aws_iam_role_policy_attachment" "dynamo_db_stream_lambda" {
  policy_arn = aws_iam_policy.dynamo_db_stream_read_access.arn
  role       = aws_iam_role.dynamo_db_stream_lambda.id
}

resource "aws_iam_role_policy_attachment" "dynamo_db_stream_lambda_cloud_watch_logs_write_access" {
  policy_arn = aws_iam_policy.cloud_watch_logs_write_access.arn
  role       = aws_iam_role.dynamo_db_stream_lambda.id
}
