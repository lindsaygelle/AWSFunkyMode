resource "aws_cognito_user_pool_client" "main" {
  auth_session_validity   = 3
  enable_token_revocation = true
  generate_secret         = true
  name                    = "public"
  user_pool_id            = aws_cognito_user_pool.main.id
}
