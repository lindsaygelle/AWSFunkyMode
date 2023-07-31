resource "aws_cognito_user_group" "admin" {
  description  = "Full Access"
  name         = "admin"
  user_pool_id = aws_cognito_user_pool.main.id
}

resource "aws_cognito_user_group" "restricted" {
  description  = "Restricted Access"
  name         = "restricted"
  user_pool_id = aws_cognito_user_pool.main.id
}
