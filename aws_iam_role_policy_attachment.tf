resource "aws_iam_role_policy_attachment" "cognito_mobile_analytics_full_access" {
  policy_arn = aws_iam_policy.mobile_analytics_full_access.arn
  role       = aws_iam_role.cognito.id
}
