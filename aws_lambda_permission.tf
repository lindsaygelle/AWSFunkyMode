resource "aws_lambda_permission" "cognito_user_pool_post_authentication" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.cognito_user_pool_post_authentication.arn
  principal     = "cognito-idp.amazonaws.com"
  source_arn    = aws_cognito_user_pool.main.arn
  statement_id  = "AllowCognitoInvoke"
}

resource "aws_lambda_permission" "cognito_user_pool_pre_authentication" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.cognito_user_pool_pre_authentication.arn
  principal     = "cognito-idp.amazonaws.com"
  source_arn    = aws_cognito_user_pool.main.arn
  statement_id  = "AllowCognitoInvoke"
}

resource "aws_lambda_permission" "cognito_user_pool_post_sign_up" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.cognito_user_pool_post_sign_up.arn
  principal     = "cognito-idp.amazonaws.com"
  source_arn    = aws_cognito_user_pool.main.arn
  statement_id  = "AllowCognitoInvoke"
}

resource "aws_lambda_permission" "cognito_user_pool_pre_sign_up" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.cognito_user_pool_pre_sign_up.arn
  principal     = "cognito-idp.amazonaws.com"
  source_arn    = aws_cognito_user_pool.main.arn
  statement_id  = "AllowCognitoInvoke"
}
