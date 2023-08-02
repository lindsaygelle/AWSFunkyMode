resource "aws_iam_policy" "app_sync_push_to_cloudwatch_logs" {
  description = "Allows AppSync to push logs to CloudWatch."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.app_sync_push_to_cloudwatch_logs.json
  name        = "${var.application}AppSyncPushToCloudWatchLogs"
  tags_all    = local.tags_all
}

resource "aws_iam_policy" "mobile_analytics_full_access" {
  description = "Provides full access to all application resources."
  path        = "/${var.application}/"
  policy      = data.aws_iam_policy_document.mobile_analytics_full_access.json
  name        = "${var.application}MobileAnalyticsFullAccess"
  tags_all    = local.tags_all
}
