// APIGateway
data "archive_file" "api_gateway_main_console_get_integration" {
  output_path = "./src/api_gateway/main/console/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/console/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_console_id_get_integration" {
  output_path = "./src/api_gateway/main/console/#id/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/console/#id/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_entity_get_integration" {
  output_path = "./src/api_gateway/main/entity/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/entity/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_entity_id_get_integration" {
  output_path = "./src/api_gateway/main/entity/#id/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/entity/#id/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_game_get_integration" {
  output_path = "./src/api_gateway/main/game/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/game/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_game_id_get_integration" {
  output_path = "./src/api_gateway/main/game/#id/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/game/#id/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_key_phrase_get_integration" {
  output_path = "./src/api_gateway/main/key_phrase/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/key_phrase/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_key_phrase_id_get_integration" {
  output_path = "./src/api_gateway/main/key_phrase/#id/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/key_phrase/#id/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_pii_get_integration" {
  output_path = "./src/api_gateway/main/pii/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/pii/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_pii_id_get_integration" {
  output_path = "./src/api_gateway/main/pii/#id/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/pii/#id/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_quote_get_integration" {
  output_path = "./src/api_gateway/main/quote/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/quote/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_quote_id_get_integration" {
  output_path = "./src/api_gateway/main/quote/#id/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/quote/#id/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_quote_subscription_get_integration" {
  output_path = "./src/api_gateway/main/quote_subscription/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/quote_subscription/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_quote_subscription_id_get_integration" {
  output_path = "./src/api_gateway/main/quote_subscription/#id/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/quote_subscription/#id/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_quote_subscription_rule_get_integration" {
  output_path = "./src/api_gateway/main/quote_subscription_rule/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/quote_subscription_rule/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_quote_subscription_rule_id_get_integration" {
  output_path = "./src/api_gateway/main/quote_subscription_rule/#id/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/quote_subscription_rule/#id/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_sentiment_get_integration" {
  output_path = "./src/api_gateway/main/sentiment/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/sentiment/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_sentiment_id_get_integration" {
  output_path = "./src/api_gateway/main/sentiment/#id/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/sentiment/#id/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_sentiment_score_get_integration" {
  output_path = "./src/api_gateway/main/sentiment_score/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/sentiment_score/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_sentiment_score_id_get_integration" {
  output_path = "./src/api_gateway/main/sentiment_score/#id/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/sentiment_score/#id/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_syntax_token_get_integration" {
  output_path = "./src/api_gateway/main/syntax_token/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/syntax_token/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_syntax_token_id_get_integration" {
  output_path = "./src/api_gateway/main/syntax_token/#id/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/syntax_token/#id/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_syntax_token_part_of_speech_get_integration" {
  output_path = "./src/api_gateway/main/syntax_token_part_of_speech/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/syntax_token_part_of_speech/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_syntax_token_part_of_speech_id_get_integration" {
  output_path = "./src/api_gateway/main/syntax_token_part_of_speech/#id/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/syntax_token_part_of_speech/#id/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_user_get_integration" {
  output_path = "./src/api_gateway/main/user/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/user/integration/GET/lambda_function/src"
  type        = "zip"
}

data "archive_file" "api_gateway_main_user_id_get_integration" {
  output_path = "./src/api_gateway/main/user/#id/integration/GET/lambda_function/file.zip"
  source_dir  = "./src/api_gateway/main/user/#id/integration/GET/lambda_function/src"
  type        = "zip"
}

// CognitoUserPools
data "archive_file" "cognito_user_pool_post_authentication" {
  output_path = "./src/cognito/main/lambda_trigger/authentication/post/lambda.zip"
  source_dir  = "./src/cognito/main/lambda_trigger/authentication/post/src"
  type        = "zip"
}

data "archive_file" "cognito_user_pool_pre_authentication" {
  output_path = "./src/cognito/main/lambda_trigger/authentication/pre/lambda.zip"
  source_dir  = "./src/cognito/main/lambda_trigger/authentication/pre/src"
  type        = "zip"
}

data "archive_file" "cognito_user_pool_post_sign_up" {
  output_path = "./src/cognito/main/lambda_trigger/sign_up/post/lambda.zip"
  source_dir  = "./src/cognito/main/lambda_trigger/sign_up/post/src"
  type        = "zip"
}

data "archive_file" "cognito_user_pool_pre_sign_up" {
  output_path = "./src/cognito/main/lambda_trigger/sign_up/pre/lambda.zip"
  source_dir  = "./src/cognito/main/lambda_trigger/sign_up/pre/src"
  type        = "zip"
}

// DynamoDB
data "archive_file" "dynamo_db_main_stream" {
  output_path = "./src/dynamo_db/main/stream/lambda_function/lambda.zip"
  source_dir  = "./src/dynamo_db/main/stream/lambda_function/src"
  type        = "zip"
}
