resource "aws_iam_role" "cognito" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_cognito.json
  name               = "CognitoAssumeRole"
  path               = "/${var.application}/"
}
