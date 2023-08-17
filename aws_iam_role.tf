resource "aws_iam_role" "api_gateway" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_api_gateway.json
  name               = "${var.application}ApiGatewayAssumeRole"
  path               = "/${var.application}/"
  tags_all           = local.tags_all
}

resource "aws_iam_role" "app_sync" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_app_sync.json
  name               = "${var.application}AppSyncAssumeRole"
  path               = "/${var.application}/"
  tags_all           = local.tags_all
}

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

resource "aws_iam_role" "lambda_app_sync" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_lambda.json
  name               = "${var.application}LambdaAppSyncAssumeRole"
  path               = "/${var.application}/"
  tags_all           = local.tags_all
}
