resource "aws_cognito_user_pool_client" "main" {
  auth_session_validity   = 3
  enable_token_revocation = true
  explicit_auth_flows = [
    "ALLOW_CUSTOM_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH"
  ]
  generate_secret               = true
  name                          = "public"
  prevent_user_existence_errors = local.environment == "production" ? "ENABLED" : "LEGACY"
  user_pool_id                  = aws_cognito_user_pool.main.id
}
