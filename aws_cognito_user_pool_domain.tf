resource "aws_cognito_user_pool_domain" "main" {
  domain       = lower(var.application)
  user_pool_id = aws_cognito_user_pool.main.id
}
