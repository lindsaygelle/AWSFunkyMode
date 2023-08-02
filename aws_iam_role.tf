resource "aws_iam_role" "app_sync" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_app_sync.json
  name               = "${var.application}AppSyncAssumeRole"
  path               = "/${var.application}/"
}

resource "aws_iam_role" "cognito" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_cognito.json
  name               = "${var.application}CognitoAssumeRole"
  path               = "/${var.application}/"
}

resource "aws_iam_role" "cognito_lambda" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_lambda.json
  name               = "${var.application}CognitoLambdaAssumeRole"
  path               = "/${var.application}/"
}
