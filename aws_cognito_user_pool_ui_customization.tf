resource "aws_cognito_user_pool_ui_customization" "main" {
  css          = file("./src/cognito/main/client/ui/customization/main.css")
  depends_on   = [aws_cognito_user_pool_domain.main]
  image_file   = filebase64("./src/cognito/main/client/ui/customization/logo.png")
  user_pool_id = aws_cognito_user_pool.main.id
}
