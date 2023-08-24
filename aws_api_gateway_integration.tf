resource "aws_api_gateway_integration" "console_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.console_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.console_get.resource_id
  rest_api_id             = aws_api_gateway_method.console_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_console_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "console_id_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.console_id_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.console_id_get.resource_id
  rest_api_id             = aws_api_gateway_method.console_id_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_console_id_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "console_post" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.console_post.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.console_post.resource_id
  rest_api_id             = aws_api_gateway_method.console_post.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_console_post_integration.invoke_arn
}

resource "aws_api_gateway_integration" "entity_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.entity_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.entity_get.resource_id
  rest_api_id             = aws_api_gateway_method.entity_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_entity_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "entity_id_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.entity_id_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.entity_id_get.resource_id
  rest_api_id             = aws_api_gateway_method.entity_id_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_entity_id_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "entity_post" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.entity_post.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.entity_post.resource_id
  rest_api_id             = aws_api_gateway_method.entity_post.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_entity_post_integration.invoke_arn
}

resource "aws_api_gateway_integration" "game_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.game_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.game_get.resource_id
  rest_api_id             = aws_api_gateway_method.game_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_game_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "game_id_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.game_id_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.game_id_get.resource_id
  rest_api_id             = aws_api_gateway_method.game_id_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_game_id_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "game_post" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.game_post.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.game_post.resource_id
  rest_api_id             = aws_api_gateway_method.game_post.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_game_post_integration.invoke_arn
}

resource "aws_api_gateway_integration" "key_phrase_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.key_phrase_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.key_phrase_get.resource_id
  rest_api_id             = aws_api_gateway_method.key_phrase_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_key_phrase_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "key_phrase_id_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.key_phrase_id_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.key_phrase_id_get.resource_id
  rest_api_id             = aws_api_gateway_method.key_phrase_id_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_key_phrase_id_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "key_phrase_post" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.key_phrase_post.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.key_phrase_post.resource_id
  rest_api_id             = aws_api_gateway_method.key_phrase_post.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_key_phrase_post_integration.invoke_arn
}

resource "aws_api_gateway_integration" "pii_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.pii_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.pii_get.resource_id
  rest_api_id             = aws_api_gateway_method.pii_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_pii_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "pii_id_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.pii_id_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.pii_id_get.resource_id
  rest_api_id             = aws_api_gateway_method.pii_id_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_pii_id_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "pii_post" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.pii_post.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.pii_post.resource_id
  rest_api_id             = aws_api_gateway_method.pii_post.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_pii_post_integration.invoke_arn
}

resource "aws_api_gateway_integration" "quote_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.quote_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.quote_get.resource_id
  rest_api_id             = aws_api_gateway_method.quote_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_quote_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "quote_id_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.quote_id_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.quote_id_get.resource_id
  rest_api_id             = aws_api_gateway_method.quote_id_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_quote_id_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "quote_post" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.quote_post.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.quote_post.resource_id
  rest_api_id             = aws_api_gateway_method.quote_post.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_quote_post_integration.invoke_arn
}

resource "aws_api_gateway_integration" "quote_subscription_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.quote_subscription_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.quote_subscription_get.resource_id
  rest_api_id             = aws_api_gateway_method.quote_subscription_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_quote_subscription_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "quote_subscription_id_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.quote_subscription_id_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.quote_subscription_id_get.resource_id
  rest_api_id             = aws_api_gateway_method.quote_subscription_id_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_quote_subscription_id_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "quote_subscription_post" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.quote_subscription_post.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.quote_subscription_post.resource_id
  rest_api_id             = aws_api_gateway_method.quote_subscription_post.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_quote_subscription_post_integration.invoke_arn
}

resource "aws_api_gateway_integration" "quote_subscription_rule_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.quote_subscription_rule_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.quote_subscription_rule_get.resource_id
  rest_api_id             = aws_api_gateway_method.quote_subscription_rule_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_quote_subscription_rule_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "quote_subscription_rule_id_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.quote_subscription_rule_id_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.quote_subscription_rule_id_get.resource_id
  rest_api_id             = aws_api_gateway_method.quote_subscription_rule_id_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_quote_subscription_rule_id_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "quote_subscription_rule_post" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.quote_subscription_rule_post.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.quote_subscription_rule_post.resource_id
  rest_api_id             = aws_api_gateway_method.quote_subscription_rule_post.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_quote_subscription_rule_post_integration.invoke_arn
}

resource "aws_api_gateway_integration" "sentiment_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.sentiment_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.sentiment_get.resource_id
  rest_api_id             = aws_api_gateway_method.sentiment_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_sentiment_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "sentiment_id_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.sentiment_id_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.sentiment_id_get.resource_id
  rest_api_id             = aws_api_gateway_method.sentiment_id_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_sentiment_id_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "sentiment_post" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.sentiment_post.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.sentiment_post.resource_id
  rest_api_id             = aws_api_gateway_method.sentiment_post.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_sentiment_post_integration.invoke_arn
}

resource "aws_api_gateway_integration" "sentiment_score_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.sentiment_score_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.sentiment_score_get.resource_id
  rest_api_id             = aws_api_gateway_method.sentiment_score_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_sentiment_score_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "sentiment_score_id_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.sentiment_score_id_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.sentiment_score_id_get.resource_id
  rest_api_id             = aws_api_gateway_method.sentiment_score_id_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_sentiment_score_id_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "sentiment_score_post" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.sentiment_score_post.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.sentiment_score_post.resource_id
  rest_api_id             = aws_api_gateway_method.sentiment_score_post.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_sentiment_score_post_integration.invoke_arn
}

resource "aws_api_gateway_integration" "syntax_token_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.syntax_token_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.syntax_token_get.resource_id
  rest_api_id             = aws_api_gateway_method.syntax_token_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_syntax_token_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "syntax_token_id_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.syntax_token_id_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.syntax_token_id_get.resource_id
  rest_api_id             = aws_api_gateway_method.syntax_token_id_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_syntax_token_id_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "syntax_token_part_of_speech_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.syntax_token_part_of_speech_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.syntax_token_part_of_speech_get.resource_id
  rest_api_id             = aws_api_gateway_method.syntax_token_part_of_speech_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_syntax_token_part_of_speech_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "syntax_token_part_of_speech_id_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.syntax_token_part_of_speech_id_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.syntax_token_part_of_speech_id_get.resource_id
  rest_api_id             = aws_api_gateway_method.syntax_token_part_of_speech_id_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_syntax_token_part_of_speech_id_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "syntax_token_part_of_speech_post" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.syntax_token_part_of_speech_post.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.syntax_token_part_of_speech_post.resource_id
  rest_api_id             = aws_api_gateway_method.syntax_token_part_of_speech_post.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_syntax_token_part_of_speech_post_integration.invoke_arn
}

resource "aws_api_gateway_integration" "syntax_token_post" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.syntax_token_post.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.syntax_token_post.resource_id
  rest_api_id             = aws_api_gateway_method.syntax_token_post.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_syntax_token_post_integration.invoke_arn
}

resource "aws_api_gateway_integration" "user_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.user_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.user_get.resource_id
  rest_api_id             = aws_api_gateway_method.user_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_user_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "user_id_get" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.user_id_get.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.user_id_get.resource_id
  rest_api_id             = aws_api_gateway_method.user_id_get.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_user_id_get_integration.invoke_arn
}

resource "aws_api_gateway_integration" "user_post" {
  credentials             = aws_iam_role.api_gateway.arn
  http_method             = aws_api_gateway_method.user_post.http_method
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  resource_id             = aws_api_gateway_method.user_post.resource_id
  rest_api_id             = aws_api_gateway_method.user_post.rest_api_id
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.api_gateway_main_user_post_integration.invoke_arn
}
