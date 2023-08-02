resource "aws_iam_role_policy_attachment" "app_sync_dynamo_db_full_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess" // TODO
  role       = aws_iam_role.app_sync.id
}

resource "aws_iam_role_policy_attachment" "app_sync_push_to_cloudwatch_logs" {
  policy_arn = aws_iam_policy.app_sync_push_to_cloudwatch_logs.arn
  role       = aws_iam_role.app_sync.id
}

resource "aws_iam_role_policy_attachment" "cognito_lambda_basic_execution_role" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole" // TODO
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
