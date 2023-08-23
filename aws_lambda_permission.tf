resource "aws_lambda_permission" "api_gateway_main_console_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_console_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_console_id_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_console_id_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_console_post_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_console_post_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_entity_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_entity_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_entity_id_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_entity_id_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_entity_post_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_entity_post_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_game_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_game_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_game_id_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_game_id_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_game_post_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_game_post_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_key_phrase_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_key_phrase_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_key_phrase_id_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_key_phrase_id_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_key_phrase_post_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_key_phrase_post_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_pii_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_pii_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_pii_id_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_pii_id_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_pii_post_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_pii_post_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_quote_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_quote_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_quote_id_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_quote_id_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_quote_post_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_quote_post_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_quote_subscription_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_quote_subscription_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_quote_subscription_id_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_quote_subscription_id_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_quote_subscription_post_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_quote_subscription_post_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_quote_subscription_rule_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_quote_subscription_rule_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_quote_subscription_rule_id_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_quote_subscription_rule_id_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_quote_subscription_rule_post_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_quote_subscription_rule_post_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_sentiment_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_sentiment_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_sentiment_id_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_sentiment_id_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_sentiment_post_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_sentiment_post_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_sentiment_score_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_sentiment_score_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_sentiment_score_id_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_sentiment_score_id_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_sentiment_score_post_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_sentiment_score_post_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_syntax_token_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_syntax_token_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_syntax_token_id_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_syntax_token_id_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_syntax_token_part_of_speech_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_syntax_token_part_of_speech_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_syntax_token_part_of_speech_id_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_syntax_token_part_of_speech_id_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_syntax_token_part_of_speech_post_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_syntax_token_part_of_speech_post_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_syntax_token_post_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_syntax_token_post_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_user_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_user_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_user_id_get_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_user_id_get_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

resource "aws_lambda_permission" "api_gateway_main_user_post_integration" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.api_gateway_main_user_post_integration.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.main.execution_arn}/*"
  statement_id  = "AllowExecutionFromAPIGateway"
}

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
