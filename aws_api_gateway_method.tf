resource "aws_api_gateway_method" "console_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.console.id
  rest_api_id          = aws_api_gateway_resource.console.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "console_id_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.console_id.id
  rest_api_id          = aws_api_gateway_resource.console_id.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "entity_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.entity.id
  rest_api_id          = aws_api_gateway_resource.entity.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "entity_id_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.entity_id.id
  rest_api_id          = aws_api_gateway_resource.entity_id.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "game_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.game.id
  rest_api_id          = aws_api_gateway_resource.game.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "game_id_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.game_id.id
  rest_api_id          = aws_api_gateway_resource.game_id.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "key_phrase_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.key_phrase.id
  rest_api_id          = aws_api_gateway_resource.key_phrase.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "key_phrase_id_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.key_phrase_id.id
  rest_api_id          = aws_api_gateway_resource.key_phrase_id.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "pii_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.pii.id
  rest_api_id          = aws_api_gateway_resource.pii.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "pii_id_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.pii_id.id
  rest_api_id          = aws_api_gateway_resource.pii_id.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "quote_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.quote.id
  rest_api_id          = aws_api_gateway_resource.quote.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "quote_id_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.quote_id.id
  rest_api_id          = aws_api_gateway_resource.quote_id.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "quote_subscription_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.quote_subscription.id
  rest_api_id          = aws_api_gateway_resource.quote_subscription.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "quote_subscription_id_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.quote_subscription_id.id
  rest_api_id          = aws_api_gateway_resource.quote_subscription_id.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "quote_subscription_rule_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.quote_subscription_rule.id
  rest_api_id          = aws_api_gateway_resource.quote_subscription_rule.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "quote_subscription_rule_id_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.quote_subscription_rule_id.id
  rest_api_id          = aws_api_gateway_resource.quote_subscription_rule_id.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "sentiment_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.sentiment.id
  rest_api_id          = aws_api_gateway_resource.sentiment.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "sentiment_id_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.sentiment_id.id
  rest_api_id          = aws_api_gateway_resource.sentiment_id.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "sentiment_score_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.sentiment_score.id
  rest_api_id          = aws_api_gateway_resource.sentiment_score.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "sentiment_score_id_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.sentiment_score_id.id
  rest_api_id          = aws_api_gateway_resource.sentiment_score_id.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "syntax_token_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.syntax_token.id
  rest_api_id          = aws_api_gateway_resource.syntax_token.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "syntax_token_id_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.syntax_token_id.id
  rest_api_id          = aws_api_gateway_resource.syntax_token_id.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "syntax_token_part_of_speech_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.syntax_token_part_of_speech.id
  rest_api_id          = aws_api_gateway_resource.syntax_token_part_of_speech.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "syntax_token_part_of_speech_id_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.syntax_token_part_of_speech_id.id
  rest_api_id          = aws_api_gateway_resource.syntax_token_part_of_speech_id.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "user_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.user.id
  rest_api_id          = aws_api_gateway_resource.user.rest_api_id
  request_models       = {}
  request_parameters   = {}
}

resource "aws_api_gateway_method" "user_id_get" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.user_id.id
  rest_api_id          = aws_api_gateway_resource.user_id.rest_api_id
  request_models       = {}
  request_parameters   = {}
}
