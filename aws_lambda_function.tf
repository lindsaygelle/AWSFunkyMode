resource "aws_lambda_function" "api_gateway_main_console_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_console_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetConsoleConnection"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_console_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_console_id_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_console_id_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetConsole"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_console_id_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_entity_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_entity_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetEntityConnection"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_entity_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_entity_id_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_entity_id_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetEntity"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_entity_id_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_game_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_game_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetGameConnection"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_game_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_game_id_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_game_id_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetGame"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_game_id_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_key_phrase_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_key_phrase_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetKeyPhraseConnection"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_key_phrase_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_key_phrase_id_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_key_phrase_id_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetKeyPhrase"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_key_phrase_id_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_pii_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_pii_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetPiiConnection"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_pii_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_pii_id_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_pii_id_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetPii"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_pii_id_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_quote_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_quote_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetQuoteConnection"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_quote_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_quote_id_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_quote_id_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetQuote"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_quote_id_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_quote_subscription_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_quote_subscription_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetQuoteSubscriptionConnection"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_quote_subscription_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_quote_subscription_id_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_quote_subscription_id_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetQuoteSubscription"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_quote_subscription_id_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_quote_subscription_rule_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_quote_subscription_rule_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetQuoteSubscriptionRuleConnection"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_quote_subscription_rule_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_quote_subscription_rule_id_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_quote_subscription_rule_id_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetQuoteSubscriptionRule"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_quote_subscription_rule_id_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_sentiment_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_sentiment_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetSentimentConnection"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_sentiment_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_sentiment_id_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_sentiment_id_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetSentiment"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_sentiment_id_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_sentiment_score_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_sentiment_score_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetSentimentScoreConnection"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_sentiment_score_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_sentiment_score_id_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_sentiment_score_id_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetSentimentScore"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_sentiment_score_id_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_syntax_token_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_syntax_token_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetSyntaxTokenConnection"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_syntax_token_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_syntax_token_id_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_syntax_token_id_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetSyntaxToken"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_syntax_token_id_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_syntax_token_part_of_speech_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_syntax_token_part_of_speech_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetSyntaxTokenPartOfSpeechConnection"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_syntax_token_part_of_speech_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_syntax_token_part_of_speech_id_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_syntax_token_part_of_speech_id_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetSyntaxTokenPartOfSpeech"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_syntax_token_part_of_speech_id_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_user_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_user_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetUserConnection"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_user_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "api_gateway_main_user_id_get_integration" {
  architectures = ["x86_64"]
  environment {
    variables = {
      APP_SYNC_API_KEY     = aws_appsync_api_key.main.key
      APP_SYNC_GRAPHQL_URL = aws_appsync_graphql_api.main.uris["GRAPHQL"]
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.api_gateway_main_user_id_get_integration.output_path
  function_name    = "FunkyModeApiGatewayGetUser"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.lambda_app_sync.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.api_gateway_main_user_id_get_integration.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "cognito_user_pool_pre_authentication" {
  architectures = ["x86_64"]
  environment {
    variables = {
      LOG_LEVEL = "INFO"
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.cognito_user_pool_pre_authentication.output_path
  function_name    = "${var.application}CognitoUserPoolPreAuthentication"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.cognito_lambda.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.cognito_user_pool_pre_authentication.output_path)
  tags_all         = local.tags_all
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "cognito_user_pool_post_authentication" {
  architectures = ["x86_64"]
  environment {
    variables = {
      LOG_LEVEL = "INFO"
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.cognito_user_pool_post_authentication.output_path
  function_name    = "${var.application}CognitoUserPoolPostAuthentication"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.cognito_lambda.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.cognito_user_pool_post_authentication.output_path)
  tags_all         = local.tags_all
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "cognito_user_pool_post_sign_up" {
  architectures = ["x86_64"]
  environment {
    variables = {
      LOG_LEVEL = "INFO"
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.cognito_user_pool_post_sign_up.output_path
  function_name    = "${var.application}CognitoUserPoolPostSignUp"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.cognito_lambda.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.cognito_user_pool_post_sign_up.output_path)
  tags_all         = local.tags_all
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "cognito_user_pool_pre_sign_up" {
  architectures = ["x86_64"]
  environment {
    variables = {
      LOG_LEVEL = "INFO"
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.cognito_user_pool_pre_sign_up.output_path
  function_name    = "${var.application}CognitoUserPoolPreSignUp"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.cognito_lambda.arn
  runtime          = "python3.11"
  source_code_hash = filebase64sha256(data.archive_file.cognito_user_pool_pre_sign_up.output_path)
  tags_all         = local.tags_all
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}
