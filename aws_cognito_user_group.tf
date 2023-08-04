resource "aws_cognito_user_group" "admin" {
  description  = "Admin Access"
  depends_on   = [aws_cognito_user_pool.main]
  name         = "admin"
  precedence   = 1
  user_pool_id = aws_cognito_user_pool.main.id
}

resource "aws_cognito_user_group" "user" {
  description  = "User Access"
  depends_on   = [aws_cognito_user_pool.main]
  name         = "user"
  precedence   = aws_cognito_user_group.admin.precedence + 1
  user_pool_id = aws_cognito_user_pool.main.id
}
