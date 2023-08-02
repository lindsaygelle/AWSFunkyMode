resource "aws_cognito_user_pool_client" "app_sync" {
  analytics_configuration {
    application_id   = aws_pinpoint_app.main.application_id
    external_id      = aws_pinpoint_app.main.name
    role_arn         = aws_iam_role.cognito.arn
    user_data_shared = true
  }
  enable_token_revocation = true
  explicit_auth_flows = [
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH"
  ]
  generate_secret               = false
  name                          = "${var.application}AppSync"
  prevent_user_existence_errors = local.is_production ? "ENABLED" : "LEGACY"
  refresh_token_validity        = 1
  supported_identity_providers = [
    "COGNITO"
  ]
  user_pool_id = aws_cognito_user_pool.main.id
}

resource "aws_cognito_user_pool_client" "website" {
  access_token_validity = 3
  allowed_oauth_flows = [
    "implicit"
  ]
  allowed_oauth_scopes = [
    "openid"
  ]
  allowed_oauth_flows_user_pool_client = true
  analytics_configuration {
    application_id   = aws_pinpoint_app.main.application_id
    external_id      = aws_pinpoint_app.main.name
    role_arn         = aws_iam_role.cognito.arn
    user_data_shared = true
  }
  auth_session_validity = 3
  callback_urls = [
    // "https://${aws_s3_bucket_website_configuration.website.website_endpoint}"
    "https://${aws_s3_bucket.website.bucket}.s3.${var.region}.amazonaws.com/${aws_s3_object.index.key}"
  ]
  enable_token_revocation = true
  explicit_auth_flows = [
    "ALLOW_CUSTOM_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH"
  ]
  generate_secret   = true
  id_token_validity = 3
  logout_urls = [
    // "https://${aws_s3_bucket_website_configuration.website.website_endpoint}/logout.html"
    "https://${aws_s3_bucket.website.bucket}.s3.${var.region}.amazonaws.com/${aws_s3_object.logout.key}"
  ]
  name                          = "${var.application}Website"
  prevent_user_existence_errors = local.is_production ? "ENABLED" : "LEGACY"
  refresh_token_validity        = 1
  supported_identity_providers = [
    "COGNITO"
  ]
  token_validity_units {
    access_token  = "hours"
    id_token      = "hours"
    refresh_token = "days"
  }
  user_pool_id = aws_cognito_user_pool.main.id
}
