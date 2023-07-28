resource "aws_cognito_user_pool_ui_customization" "main" {
  image_file   = filebase64("./img/cognito/ui/customization/icon.png")
  user_pool_id = aws_cognito_user_pool.main.id
}
