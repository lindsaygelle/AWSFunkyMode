resource "aws_cognito_user_group" "admin" {
  description  = "Full Access"
  depends_on   = [aws_cognito_user_pool.main]
  name         = "admin"
  user_pool_id = aws_cognito_user_pool.main.id
}

resource "aws_cognito_user_group" "restricted" {
  description  = "Restricted Access"
  depends_on   = [aws_cognito_user_pool.main]
  name         = "restricted"
  user_pool_id = aws_cognito_user_pool.main.id
}
