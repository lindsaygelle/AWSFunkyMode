resource "aws_iam_policy" "mobile_analytics_full_access" {
  description = "Provides full access to all application resources."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.mobile_analytics_full_access.json
  name        = "${var.application}MobileAnalyticsFullAccess"
  tags_all    = local.tags_all
}
