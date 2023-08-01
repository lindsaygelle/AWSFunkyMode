resource "aws_appsync_graphql_api" "main" {
  authentication_type = "AMAZON_COGNITO_USER_POOLS"
  log_config {
    cloudwatch_logs_role_arn = aws_iam_role.app_sync.arn
    exclude_verbose_content  = false
    field_log_level          = "ALL"
  }
  name     = var.application
  tags_all = local.tags_all
  user_pool_config {
    aws_region     = var.region
    default_action = "DENY"
    user_pool_id   = aws_cognito_user_pool.main.id
  }
}
