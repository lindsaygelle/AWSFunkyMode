resource "aws_appsync_resolver" "create_console" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createConsole"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/mutation/request/console.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/mutation/response/console.vtl")
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_console" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getConsole"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/console.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/console.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "get_consoles" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getConsoles"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/console_connection.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/console_connection.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "create_game" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createGame"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/mutation/request/game.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/mutation/response/game.vtl")
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_game" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getGame"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/game.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/game.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "get_games" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getGames"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/game_connection.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/game_connection.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "create_quote" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createQuote"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/mutation/request/quote.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/mutation/response/quote.vtl")
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_quote" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getQuote"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/quote.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/quote.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "get_quotes" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getQuotes"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/quote_connection.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/quote_connection.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "create_entity" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createEntity"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/mutation/request/entity.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/mutation/response/entity.vtl")
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_entity" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getEntity"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/entity.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/entity.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "get_entities" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getEntities"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/entity_connection.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/entity_connection.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "create_key_phrase" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createKeyPhrase"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/mutation/request/key_phrase.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/mutation/response/key_phrase.vtl")
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_key_phrase" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getKeyPhrase"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/key_phrase.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/key_phrase.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "get_key_phrases" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getKeyPhrases"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/key_phrase_connection.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/key_phrase_connection.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "create_pii" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createPII"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/mutation/request/pii.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/mutation/response/pii.vtl")
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_pii" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getPII"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/pii.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/pii.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "get_piis" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getPIIs"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/pii_connection.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/pii_connection.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "create_sentiment" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createSentiment"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/mutation/request/sentiment.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/mutation/response/sentiment.vtl")
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_sentiment" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSentiment"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/sentiment.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/sentiment.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "get_sentiments" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSentiments"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/sentiment_connection.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/sentiment_connection.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "create_sentiment_score" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createSentimentScore"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/mutation/request/sentiment_score.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/mutation/response/sentiment_score.vtl")
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_sentiment_score" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSentimentScore"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/sentiment_score.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/sentiment_score.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "get_sentiment_scores" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSentimentScores"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/sentiment_score_connection.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/sentiment_score_connection.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "create_syntax_token" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createSyntaxToken"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/mutation/request/syntax_token.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/mutation/response/syntax_token.vtl")
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_syntax_token" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSyntaxToken"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/syntax_token.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/syntax_token.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "get_syntax_tokens" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSyntaxTokens"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/syntax_token_connection.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/syntax_token_connection.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "create_syntax_token_part_of_speech" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createSyntaxTokenPartOfSpeech"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/mutation/request/syntax_token_part_of_speech.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/mutation/response/syntax_token_part_of_speech.vtl")
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_syntax_token_part_of_speech" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSyntaxTokenPartOfSpeech"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/syntax_token_part_of_speech.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/syntax_token_part_of_speech.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "get_syntax_token_part_of_speechs" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSyntaxTokenPartOfSpeechs"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/syntax_token_part_of_speech_connection.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/syntax_token_part_of_speech_connection.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "create_user" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createUser"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/mutation/request/user.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/mutation/response/user.vtl")
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_user" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getUser"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/user.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/user.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "get_users" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getUsers"
  request_template  = file("./src/app_sync/resolver/unit/dynamo_db/query/request/user_connection.vtl")
  response_template = file("./src/app_sync/resolver/unit/dynamo_db/query/response/user_connection.vtl")
  type              = "Query"
}
