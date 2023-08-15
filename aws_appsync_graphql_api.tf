resource "aws_appsync_graphql_api" "main" {
  additional_authentication_provider {
    authentication_type = "AMAZON_COGNITO_USER_POOLS"
    user_pool_config {
      aws_region   = var.region
      user_pool_id = aws_cognito_user_pool.main.id
    }
  }
  authentication_type = "API_KEY"
  depends_on = [
    aws_cognito_user_group.admin,
    aws_cognito_user_group.user
  ]
  log_config {
    cloudwatch_logs_role_arn = aws_iam_role.app_sync.arn
    exclude_verbose_content  = false
    field_log_level          = "ALL"
  }
  name         = var.application
  schema       = file("./src/app_sync/graphql/schema.graphql")
  tags_all     = local.tags_all
  xray_enabled = local.is_production ? true : false
}
