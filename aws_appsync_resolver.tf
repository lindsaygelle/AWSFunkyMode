resource "aws_appsync_resolver" "create_console" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/console/resolver/unit/dynamo_db/mutation/create_console.js")
  data_source = aws_appsync_datasource.main.name
  field       = "create_console"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "create_entity" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/entity/resolver/unit/dynamo_db/mutation/create_entity.js")
  data_source = aws_appsync_datasource.main.name
  field       = "create_entity"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "create_game" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/game/resolver/unit/dynamo_db/mutation/create_game.js")
  data_source = aws_appsync_datasource.main.name
  field       = "create_game"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "create_key_phrase" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/key_phrase/resolver/unit/dynamo_db/mutation/create_key_phrase.js")
  data_source = aws_appsync_datasource.main.name
  field       = "create_key_phrase"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "create_pii" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/pii/resolver/unit/dynamo_db/mutation/create_pii.js")
  data_source = aws_appsync_datasource.main.name
  field       = "create_pii"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "create_quote" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/quote/resolver/unit/dynamo_db/mutation/create_quote.js")
  data_source = aws_appsync_datasource.main.name
  field       = "create_quote"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "create_quote_subscription" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/quote_subscription/resolver/unit/dynamo_db/mutation/create_quote_subscription.js")
  data_source = aws_appsync_datasource.main.name
  field       = "create_quote_subscription"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "create_quote_subscription_rule" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/quote_subscription_rule/resolver/unit/dynamo_db/mutation/create_quote_subscription_rule.js")
  data_source = aws_appsync_datasource.main.name
  field       = "create_quote_subscription_rule"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "create_sentiment" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/sentiment/resolver/unit/dynamo_db/mutation/create_sentiment.js")
  data_source = aws_appsync_datasource.main.name
  field       = "create_sentiment"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "create_sentiment_score" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/sentiment_score/resolver/unit/dynamo_db/mutation/create_sentiment_score.js")
  data_source = aws_appsync_datasource.main.name
  field       = "create_sentiment_score"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "create_syntax_token" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/syntax_token/resolver/unit/dynamo_db/mutation/create_syntax_token.js")
  data_source = aws_appsync_datasource.main.name
  field       = "create_syntax_token"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "create_syntax_token_part_of_speech" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/syntax_token_part_of_speech/resolver/unit/dynamo_db/mutation/create_syntax_token_part_of_speech.js")
  data_source = aws_appsync_datasource.main.name
  field       = "create_syntax_token_part_of_speech"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "create_user" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/user/resolver/unit/dynamo_db/mutation/create_user.js")
  data_source = aws_appsync_datasource.main.name
  field       = "create_user"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "delete_console" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/console/resolver/unit/dynamo_db/mutation/delete_console.js")
  data_source = aws_appsync_datasource.main.name
  field       = "delete_console"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "delete_entity" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/entity/resolver/unit/dynamo_db/mutation/delete_entity.js")
  data_source = aws_appsync_datasource.main.name
  field       = "delete_entity"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "delete_game" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/game/resolver/unit/dynamo_db/mutation/delete_game.js")
  data_source = aws_appsync_datasource.main.name
  field       = "delete_game"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "delete_key_phrase" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/key_phrase/resolver/unit/dynamo_db/mutation/delete_key_phrase.js")
  data_source = aws_appsync_datasource.main.name
  field       = "delete_key_phrase"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "delete_pii" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/pii/resolver/unit/dynamo_db/mutation/delete_pii.js")
  data_source = aws_appsync_datasource.main.name
  field       = "delete_pii"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "delete_quote" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/quote/resolver/unit/dynamo_db/mutation/delete_quote.js")
  data_source = aws_appsync_datasource.main.name
  field       = "delete_quote"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "delete_quote_subscription" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/quote_subscription/resolver/unit/dynamo_db/mutation/delete_quote_subscription.js")
  data_source = aws_appsync_datasource.main.name
  field       = "delete_quote_subscription"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "delete_quote_subscription_rule" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/quote_subscription_rule/resolver/unit/dynamo_db/mutation/delete_quote_subscription_rule.js")
  data_source = aws_appsync_datasource.main.name
  field       = "delete_quote_subscription_rule"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "delete_sentiment" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/sentiment/resolver/unit/dynamo_db/mutation/delete_sentiment.js")
  data_source = aws_appsync_datasource.main.name
  field       = "delete_sentiment"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "delete_sentiment_score" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/sentiment_score/resolver/unit/dynamo_db/mutation/delete_sentiment_score.js")
  data_source = aws_appsync_datasource.main.name
  field       = "delete_sentiment_score"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "delete_syntax_token" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/syntax_token/resolver/unit/dynamo_db/mutation/delete_syntax_token.js")
  data_source = aws_appsync_datasource.main.name
  field       = "delete_syntax_token"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "delete_syntax_token_part_of_speech" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/syntax_token_part_of_speech/resolver/unit/dynamo_db/mutation/delete_syntax_token_part_of_speech.js")
  data_source = aws_appsync_datasource.main.name
  field       = "delete_syntax_token_part_of_speech"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "delete_user" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/user/resolver/unit/dynamo_db/mutation/delete_user.js")
  data_source = aws_appsync_datasource.main.name
  field       = "delete_user"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Mutation"
}

resource "aws_appsync_resolver" "get_console" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/console/resolver/unit/dynamo_db/query/get_console.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_console"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_console_connection" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/console/resolver/unit/dynamo_db/query/get_console_connection.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_console_connection"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_entity" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/entity/resolver/unit/dynamo_db/query/get_entity.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_entity"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_entity_connection" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/entity/resolver/unit/dynamo_db/query/get_entity_connection.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_entity_connection"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_game" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/game/resolver/unit/dynamo_db/query/get_game.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_game"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_game_connection" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/game/resolver/unit/dynamo_db/query/get_game_connection.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_game_connection"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_key_phrase" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/key_phrase/resolver/unit/dynamo_db/query/get_key_phrase.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_key_phrase"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_key_phrase_connection" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/key_phrase/resolver/unit/dynamo_db/query/get_key_phrase_connection.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_key_phrase_connection"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_pii" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/pii/resolver/unit/dynamo_db/query/get_pii.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_pii"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_pii_connection" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/pii/resolver/unit/dynamo_db/query/get_pii_connection.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_pii_connection"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_quote" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/quote/resolver/unit/dynamo_db/query/get_quote.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_quote"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_quote_connection" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/quote/resolver/unit/dynamo_db/query/get_quote_connection.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_quote_connection"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_quote_subscription" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/quote_subscription/resolver/unit/dynamo_db/query/get_quote_subscription.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_quote_subscription"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_quote_subscription_connection" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/quote_subscription/resolver/unit/dynamo_db/query/get_quote_subscription_connection.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_quote_subscription_connection"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_quote_subscription_rule" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/quote_subscription_rule/resolver/unit/dynamo_db/query/get_quote_subscription_rule.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_quote_subscription_rule"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_quote_subscription_rule_connection" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/quote_subscription_rule/resolver/unit/dynamo_db/query/get_quote_subscription_rule_connection.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_quote_subscription_rule_connection"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_sentiment" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/sentiment/resolver/unit/dynamo_db/query/get_sentiment.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_sentiment"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_sentiment_connection" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/sentiment/resolver/unit/dynamo_db/query/get_sentiment_connection.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_sentiment_connection"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_sentiment_score" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/sentiment_score/resolver/unit/dynamo_db/query/get_sentiment_score.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_sentiment_score"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_sentiment_score_connection" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/sentiment_score/resolver/unit/dynamo_db/query/get_sentiment_score_connection.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_sentiment_score_connection"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_syntax_token" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/syntax_token/resolver/unit/dynamo_db/query/get_syntax_token.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_syntax_token"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_syntax_token_connection" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/syntax_token/resolver/unit/dynamo_db/query/get_syntax_token_connection.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_syntax_token_connection"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_syntax_token_part_of_speech" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/syntax_token_part_of_speech/resolver/unit/dynamo_db/query/get_syntax_token_part_of_speech.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_syntax_token_part_of_speech"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_syntax_token_part_of_speech_connection" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/syntax_token_part_of_speech/resolver/unit/dynamo_db/query/get_syntax_token_part_of_speech_connection.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_syntax_token_part_of_speech_connection"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_user" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/user/resolver/unit/dynamo_db/query/get_user.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_user"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}

resource "aws_appsync_resolver" "get_user_connection" {
  api_id      = aws_appsync_graphql_api.main.id
  code        = file("./src/app_sync/main/user/resolver/unit/dynamo_db/query/get_user_connection.js")
  data_source = aws_appsync_datasource.main.name
  field       = "get_user_connection"
  kind        = "UNIT"
  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
  type = "Query"
}
