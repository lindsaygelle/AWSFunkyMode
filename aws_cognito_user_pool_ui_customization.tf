resource "aws_cognito_user_pool_ui_customization" "main" {
  css          = file("./src/cognito/user_pool/client/ui/customization/main.css")
  image_file   = filebase64("./src/cognito/user_pool/client/ui/customization/logo.png")
  user_pool_id = aws_cognito_user_pool.main.id
}
