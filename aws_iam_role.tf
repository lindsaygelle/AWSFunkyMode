// APIGateway
resource "aws_iam_role" "api_gateway" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_api_gateway.json
  name               = "${var.application}ApiGatewayAssumeRole"
  path               = "/${var.application}/"
  tags_all           = local.tags_all
}

// AppSync
resource "aws_iam_role" "app_sync" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_app_sync.json
  name               = "${var.application}AppSyncAssumeRole"
  path               = "/${var.application}/"
  tags_all           = local.tags_all
}

resource "aws_iam_role" "app_sync_lambda" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_lambda.json
  name               = "${var.application}AppSyncLambdaAssumeRole"
  path               = "/${var.application}/"
  tags_all           = local.tags_all
}

// CognitoUserPools
resource "aws_iam_role" "cognito" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_cognito.json
  name               = "${var.application}CognitoAssumeRole"
  path               = "/${var.application}/"
  tags_all           = local.tags_all
}

resource "aws_iam_role" "cognito_lambda" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_lambda.json
  name               = "${var.application}CognitoLambdaAssumeRole"
  path               = "/${var.application}/"
  tags_all           = local.tags_all
}

// DynamoDB
resource "aws_iam_role" "dynamo_db_stream_lambda" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_lambda.json
  name               = "${var.application}DynamoDBStreamLambdaAssumeRole"
  path               = "/${var.application}/"
  tags_all           = local.tags_all
}
