resource "aws_api_gateway_resource" "console" {
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "console"
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_resource" "console_id" {
  parent_id   = aws_api_gateway_resource.console.id
  path_part   = "{id}"
  rest_api_id = aws_api_gateway_resource.console.rest_api_id
}

resource "aws_api_gateway_resource" "entity" {
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "entity"
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_resource" "entity_id" {
  parent_id   = aws_api_gateway_resource.entity.id
  path_part   = "{id}"
  rest_api_id = aws_api_gateway_resource.entity.rest_api_id
}

resource "aws_api_gateway_resource" "game" {
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "game"
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_resource" "game_id" {
  parent_id   = aws_api_gateway_resource.game.id
  path_part   = "{id}"
  rest_api_id = aws_api_gateway_resource.game.rest_api_id
}

resource "aws_api_gateway_resource" "key_phrase" {
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "key_phrase"
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_resource" "key_phrase_id" {
  parent_id   = aws_api_gateway_resource.key_phrase.id
  path_part   = "{id}"
  rest_api_id = aws_api_gateway_resource.key_phrase.rest_api_id
}

resource "aws_api_gateway_resource" "pii" {
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "pii"
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_resource" "pii_id" {
  parent_id   = aws_api_gateway_resource.pii.id
  path_part   = "{id}"
  rest_api_id = aws_api_gateway_resource.pii.rest_api_id
}

resource "aws_api_gateway_resource" "quote" {
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "quote"
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_resource" "quote_id" {
  parent_id   = aws_api_gateway_resource.quote.id
  path_part   = "{id}"
  rest_api_id = aws_api_gateway_resource.quote.rest_api_id
}

resource "aws_api_gateway_resource" "quote_subscription" {
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "quote_subscription"
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_resource" "quote_subscription_id" {
  parent_id   = aws_api_gateway_resource.quote_subscription.id
  path_part   = "{id}"
  rest_api_id = aws_api_gateway_resource.quote_subscription.rest_api_id
}

resource "aws_api_gateway_resource" "quote_subscription_rule" {
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "quote_subscription_rule"
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_resource" "quote_subscription_rule_id" {
  parent_id   = aws_api_gateway_resource.quote_subscription_rule.id
  path_part   = "{id}"
  rest_api_id = aws_api_gateway_resource.quote_subscription_rule.rest_api_id
}

resource "aws_api_gateway_resource" "sentiment" {
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "sentiment"
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_resource" "sentiment_id" {
  parent_id   = aws_api_gateway_resource.sentiment.id
  path_part   = "{id}"
  rest_api_id = aws_api_gateway_resource.sentiment.rest_api_id
}

resource "aws_api_gateway_resource" "sentiment_score" {
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "sentiment_score"
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_resource" "sentiment_score_id" {
  parent_id   = aws_api_gateway_resource.sentiment_score.id
  path_part   = "{id}"
  rest_api_id = aws_api_gateway_resource.sentiment_score.rest_api_id
}

resource "aws_api_gateway_resource" "syntax_token" {
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "syntax_token"
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_resource" "syntax_token_id" {
  parent_id   = aws_api_gateway_resource.syntax_token.id
  path_part   = "{id}"
  rest_api_id = aws_api_gateway_resource.syntax_token.rest_api_id
}

resource "aws_api_gateway_resource" "syntax_token_part_of_speech" {
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "syntax_token_part_of_speech"
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_resource" "syntax_token_part_of_speech_id" {
  parent_id   = aws_api_gateway_resource.syntax_token_part_of_speech.id
  path_part   = "{id}"
  rest_api_id = aws_api_gateway_resource.syntax_token_part_of_speech.rest_api_id
}

resource "aws_api_gateway_resource" "user" {
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "user"
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_resource" "user_id" {
  parent_id   = aws_api_gateway_resource.user.id
  path_part   = "{id}"
  rest_api_id = aws_api_gateway_resource.user.rest_api_id
}
