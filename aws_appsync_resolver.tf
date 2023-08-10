resource "aws_appsync_resolver" "create_console" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createConsole"
  request_template  = <<EOF
#set($id = $util.autoId())
#set($createdDate = $util.time.nowISO8601())
#set($pk = "Console")
#set($sk = $id)
#set($updatedDate = $createdDate)
{
    "version" : "2018-05-29",
    "operation" : "PutItem",
    "key" : {
        "pk": $util.dynamodb.toDynamoDBJson($pk),
        "sk": $util.dynamodb.toDynamoDBJson($sk)
    },
    "attributeValues" : {
    	"abbreviation": $util.dynamodb.toDynamoDBJson($ctx.args.input.abbreviation),
    	"createdDate": $util.dynamodb.toDynamoDBJson($createdDate),
    	"id": $util.dynamodb.toDynamoDBJson($id),
      "name": $util.dynamodb.toDynamoDBJson($ctx.args.input.name),
    	"updatedDate": $util.dynamodb.toDynamoDBJson($updatedDate),
    }
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_console" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getConsole"
  request_template  = <<EOF
{
    "version": "2018-05-29",
    "operation": "Query",
    "query": {
        "expression": "pk = :pk and sk = :sk",
        "expressionValues": {
            ":pk": $util.dynamodb.toDynamoDBJson("Console"),
            ":sk": $util.dynamodb.toDynamoDBJson($ctx.args.id)
        }
    },
    "scanIndexForward": false
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "get_consoles" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getConsoles"
  request_template  = <<EOF
{
    "version" : "2017-02-28",
    "operation" : "Query",
    "query" : {
        "expression": "pk = :pk",
        "expressionValues" : {
            ":pk" : {
                "S" : "Console"
            }
        }
    },
    "limit": $util.defaultIfNull($ctx.args.limit, 10),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($ctx.args.nextToken, null))
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
{
    "items": $util.toJson($ctx.result.items),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($context.result.nextToken, null))
}
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "create_game" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createGame"
  request_template  = <<EOF
#set($id = $util.autoId())
#set($createdDate = $util.time.nowISO8601())
#set($pk = "Game")
#set($sk = $id)
#set($updatedDate = $createdDate)
{
    "version" : "2018-05-29",
    "operation" : "PutItem",
    "key" : {
        "pk": $util.dynamodb.toDynamoDBJson($pk),
        "sk": $util.dynamodb.toDynamoDBJson($sk)
    },
    "attributeValues" : {
        "consoleId": $util.dynamodb.toDynamoDBJson($ctx.args.input.consoleId),
        "createdDate": $util.dynamodb.toDynamoDBJson($createdDate),
        "id": $util.dynamodb.toDynamoDBJson($id),
        "name": $util.dynamodb.toDynamoDBJson($ctx.args.input.name),
        "updatedDate": $util.dynamodb.toDynamoDBJson($updatedDate),
    }
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_game" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getGame"
  request_template  = <<EOF
{
    "version": "2018-05-29",
    "operation": "Query",
    "query": {
        "expression": "pk = :pk and sk = :sk",
        "expressionValues": {
            ":pk": $util.dynamodb.toDynamoDBJson("Game"),
            ":sk": $util.dynamodb.toDynamoDBJson($ctx.args.id)
        }
    },
    "scanIndexForward": false
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "get_games" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getGames"
  request_template  = <<EOF
{
    "version" : "2017-02-28",
    "operation" : "Query",
    "query" : {
        "expression": "pk = :pk",
        "expressionValues" : {
            ":pk" : {
                "S" : "Game"
            }
        }
    },
    "limit": $util.defaultIfNull($ctx.args.limit, 10),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($ctx.args.nextToken, null))
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
{
    "items": $util.toJson($ctx.result.items),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($context.result.nextToken, null))
}
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "create_quote" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createQuote"
  request_template  = <<EOF
#set($id = $util.autoId())
#set($createdDate = $util.time.nowISO8601())
#set($pk = "Quote")
#set($sk = $id)
#set($updatedDate = $createdDate)
{
    "version" : "2018-05-29",
    "operation" : "PutItem",
    "key" : {
        "pk": $util.dynamodb.toDynamoDBJson($pk),
        "sk": $util.dynamodb.toDynamoDBJson($sk)
    },
    "attributeValues" : {
        "beginOffset": $util.dynamodb.toDynamoDBJson($ctx.args.input.beginOffset),
        "createdDate": $util.dynamodb.toDynamoDBJson($createdDate),
        "endOffset": $util.dynamodb.toDynamoDBJson($ctx.args.input.endOffset),
        "id": $util.dynamodb.toDynamoDBJson($ctx.args.input.id),
        "order": $util.dynamodb.toDynamoDBJson($ctx.args.input.order),
        "quoteId": $util.dynamodb.toDynamoDBJson($ctx.args.input.quoteId),
        "score": $util.dynamodb.toDynamoDBJson($ctx.args.input.score),
        "text": $util.dynamodb.toDynamoDBJson($ctx.args.input.text),
        "type": $util.dynamodb.toDynamoDBJson($ctx.args.input.type),
        "updatedDate": $util.dynamodb.toDynamoDBJson($updatedDate),
    }
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_quote" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getQuote"
  request_template  = <<EOF
{
    "version": "2018-05-29",
    "operation": "Query",
    "query": {
        "expression": "pk = :pk and sk = :sk",
        "expressionValues": {
            ":pk": $util.dynamodb.toDynamoDBJson("Quote"),
            ":sk": $util.dynamodb.toDynamoDBJson($ctx.args.id)
        }
    },
    "scanIndexForward": false
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "get_quotes" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getQuotes"
  request_template  = <<EOF
{
    "version" : "2017-02-28",
    "operation" : "Query",
    "query" : {
        "expression": "pk = :pk",
        "expressionValues" : {
            ":pk" : {
                "S" : "Quote"
            }
        }
    },
    "limit": $util.defaultIfNull($ctx.args.limit, 10),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($ctx.args.nextToken, null))
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
{
    "items": $util.toJson($ctx.result.items),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($context.result.nextToken, null))
}
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "create_entity" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createEntity"
  request_template  = <<EOF
#set($id = $util.autoId())
#set($createdDate = $util.time.nowISO8601())
#set($pk = "Entity")
#set($sk = $id)
#set($updatedDate = $createdDate)
{
    "version" : "2018-05-29",
    "operation" : "PutItem",
    "key" : {
        "pk": $util.dynamodb.toDynamoDBJson($pk),
        "sk": $util.dynamodb.toDynamoDBJson($sk)
    },
    "attributeValues" : {
        "beginOffset": $util.dynamodb.toDynamoDBJson($ctx.args.input.beginOffset),
        "createdDate": $util.dynamodb.toDynamoDBJson($createdDate),
        "endOffset": $util.dynamodb.toDynamoDBJson($ctx.args.input.endOffset),
        "id": $util.dynamodb.toDynamoDBJson($id),
        "order": $util.dynamodb.toDynamoDBJson($ctx.args.input.order),
        "quoteId": $util.dynamodb.toDynamoDBJson($ctx.args.input.quoteId),
        "score": $util.dynamodb.toDynamoDBJson($ctx.args.input.score),
        "text": $util.dynamodb.toDynamoDBJson($ctx.args.input.text),
        "type": $util.dynamodb.toDynamoDBJson($ctx.args.input.type),
        "updatedDate": $util.dynamodb.toDynamoDBJson($updatedDate),
    }
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_entity" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getEntity"
  request_template  = <<EOF
{
    "version": "2018-05-29",
    "operation": "Query",
    "query": {
        "expression": "pk = :pk and sk = :sk",
        "expressionValues": {
            ":pk": $util.dynamodb.toDynamoDBJson("Entity"),
            ":sk": $util.dynamodb.toDynamoDBJson($ctx.args.id)
        }
    },
    "scanIndexForward": false
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "get_entities" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getEntities"
  request_template  = <<EOF
{
    "version" : "2017-02-28",
    "operation" : "Query",
    "query" : {
        "expression": "pk = :pk",
        "expressionValues" : {
            ":pk" : {
                "S" : "Entity"
            }
        }
    },
    "limit": $util.defaultIfNull($ctx.args.limit, 10),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($ctx.args.nextToken, null))
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
{
    "items": $util.toJson($ctx.result.items),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($context.result.nextToken, null))
}
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "create_key_phrase" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createKeyPhrase"
  request_template  = <<EOF
#set($id = $util.autoId())
#set($createdDate = $util.time.nowISO8601())
#set($pk = "KeyPhrase")
#set($sk = $id)
#set($updatedDate = $createdDate)
{
    "version" : "2018-05-29",
    "operation" : "PutItem",
    "key" : {
        "pk": $util.dynamodb.toDynamoDBJson($pk),
        "sk": $util.dynamodb.toDynamoDBJson($sk)
    },
    "attributeValues" : {
        "createdDate": $util.dynamodb.toDynamoDBJson($createdDate),
        "beginOffset": $util.dynamodb.toDynamoDBJson($ctx.args.input.beginOffset),
        "endOffset": $util.dynamodb.toDynamoDBJson($ctx.args.input.endOffset),
        "id": $util.dynamodb.toDynamoDBJson($id),
        "order": $util.dynamodb.toDynamoDBJson($ctx.args.input.order),
        "quoteId": $util.dynamodb.toDynamoDBJson($ctx.args.input.quoteId),
        "score": $util.dynamodb.toDynamoDBJson($ctx.args.input.score),
        "text": $util.dynamodb.toDynamoDBJson($ctx.args.input.text),
        "updatedDate": $util.dynamodb.toDynamoDBJson($updatedDate),
    }
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_key_phrase" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getKeyPhrase"
  request_template  = <<EOF
{
    "version": "2018-05-29",
    "operation": "Query",
    "query": {
        "expression": "pk = :pk and sk = :sk",
        "expressionValues": {
            ":pk": $util.dynamodb.toDynamoDBJson("KeyPhrase"),
            ":sk": $util.dynamodb.toDynamoDBJson($ctx.args.id)
        }
    },
    "scanIndexForward": false
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "get_key_phrases" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getKeyPhrases"
  request_template  = <<EOF
{
    "version" : "2017-02-28",
    "operation" : "Query",
    "query" : {
        "expression": "pk = :pk",
        "expressionValues" : {
            ":pk" : {
                "S" : "KeyPhrase"
            }
        }
    },
    "limit": $util.defaultIfNull($ctx.args.limit, 10),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($ctx.args.nextToken, null))
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
{
    "items": $util.toJson($ctx.result.items),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($context.result.nextToken, null))
}
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "create_pii" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createPII"
  request_template  = <<EOF
#set($id = $util.autoId())
#set($createdDate = $util.time.nowISO8601())
#set($pk = "PII")
#set($sk = $id)
#set($updatedDate = $createdDate)
{
    "version" : "2018-05-29",
    "operation" : "PutItem",
    "key" : {
        "pk": $util.dynamodb.toDynamoDBJson($pk),
        "sk": $util.dynamodb.toDynamoDBJson($sk)
    },
    "attributeValues" : {
        "beginOffset": $util.dynamodb.toDynamoDBJson($ctx.args.input.beginOffset),
        "createdDate": $util.dynamodb.toDynamoDBJson($createdDate),
        "endOffset": $util.dynamodb.toDynamoDBJson($ctx.args.input.endOffset),
        "id": $util.dynamodb.toDynamoDBJson($id),
        "order": $util.dynamodb.toDynamoDBJson($ctx.args.input.order),
        "quoteId": $util.dynamodb.toDynamoDBJson($ctx.args.input.quoteId),
        "score": $util.dynamodb.toDynamoDBJson($ctx.args.input.score),
        "type": $util.dynamodb.toDynamoDBJson($ctx.args.input.type),
        "updatedDate": $util.dynamodb.toDynamoDBJson($updatedDate),
    }
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_pii" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getPII"
  request_template  = <<EOF
{
    "version": "2018-05-29",
    "operation": "Query",
    "query": {
        "expression": "pk = :pk and sk = :sk",
        "expressionValues": {
            ":pk": $util.dynamodb.toDynamoDBJson("PII"),
            ":sk": $util.dynamodb.toDynamoDBJson($ctx.args.id)
        }
    },
    "scanIndexForward": false
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "get_piis" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getPIIs"
  request_template  = <<EOF
{
    "version" : "2017-02-28",
    "operation" : "Query",
    "query" : {
        "expression": "pk = :pk",
        "expressionValues" : {
            ":pk" : {
                "S" : "PII"
            }
        }
    },
    "limit": $util.defaultIfNull($ctx.args.limit, 10),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($ctx.args.nextToken, null))
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
{
    "items": $util.toJson($ctx.result.items),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($context.result.nextToken, null))
}
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "create_sentiment" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createSentiment"
  request_template  = <<EOF
#set($id = $util.autoId())
#set($createdDate = $util.time.nowISO8601())
#set($pk = "Sentiment")
#set($sk = $id)
#set($updatedDate = $createdDate)
{
    "version" : "2018-05-29",
    "operation" : "PutItem",
    "key" : {
        "pk": $util.dynamodb.toDynamoDBJson($pk),
        "sk": $util.dynamodb.toDynamoDBJson($sk)
    },
    "attributeValues" : {
        "createdDate": $util.dynamodb.toDynamoDBJson($createdDate),
        "id": $util.dynamodb.toDynamoDBJson($id),
        "quoteId": $util.dynamodb.toDynamoDBJson($ctx.args.input.quoteId),
        "sentiment": $util.dynamodb.toDynamoDBJson($ctx.args.input.sentiment),
        "updatedDate": $util.dynamodb.toDynamoDBJson($updatedDate),
    }
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_sentiment" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSentiment"
  request_template  = <<EOF
{
    "version": "2018-05-29",
    "operation": "Query",
    "query": {
        "expression": "pk = :pk and sk = :sk",
        "expressionValues": {
            ":pk": $util.dynamodb.toDynamoDBJson("Sentiment"),
            ":sk": $util.dynamodb.toDynamoDBJson($ctx.args.id)
        }
    },
    "scanIndexForward": false
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "get_sentiments" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSentiments"
  request_template  = <<EOF
{
    "version" : "2017-02-28",
    "operation" : "Query",
    "query" : {
        "expression": "pk = :pk",
        "expressionValues" : {
            ":pk" : {
                "S" : "Sentiment"
            }
        }
    },
    "limit": $util.defaultIfNull($ctx.args.limit, 10),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($ctx.args.nextToken, null))
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
{
    "items": $util.toJson($ctx.result.items),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($context.result.nextToken, null))
}
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "create_sentiment_score" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createSentimentScore"
  request_template  = <<EOF
#set($id = $util.autoId())
#set($createdDate = $util.time.nowISO8601())
#set($pk = "SentimentScore")
#set($sk = $id)
#set($updatedDate = $createdDate)
{
    "version" : "2018-05-29",
    "operation" : "PutItem",
    "key" : {
        "pk": $util.dynamodb.toDynamoDBJson($pk),
        "sk": $util.dynamodb.toDynamoDBJson($sk)
    },
    "attributeValues" : {
        "createdDate": $util.dynamodb.toDynamoDBJson($createdDate),
        "id": $util.dynamodb.toDynamoDBJson($id),
        "mixed": $util.dynamodb.toDynamoDBJson($ctx.args.input.mixed),
        "negative": $util.dynamodb.toDynamoDBJson($ctx.args.input.negative),
        "neutral": $util.dynamodb.toDynamoDBJson($ctx.args.input.neutral),
        "positive": $util.dynamodb.toDynamoDBJson($ctx.args.input.positive),
        "sentimentId": $util.dynamodb.toDynamoDBJson($ctx.args.input.sentimentId),
        "updatedDate": $util.dynamodb.toDynamoDBJson($updatedDate),
    }
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_sentiment_score" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSentimentScore"
  request_template  = <<EOF
{
    "version": "2018-05-29",
    "operation": "Query",
    "query": {
        "expression": "pk = :pk and sk = :sk",
        "expressionValues": {
            ":pk": $util.dynamodb.toDynamoDBJson("SentimentScore"),
            ":sk": $util.dynamodb.toDynamoDBJson($ctx.args.id)
        }
    },
    "scanIndexForward": false
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "get_sentiment_scores" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSentimentScores"
  request_template  = <<EOF
{
    "version" : "2017-02-28",
    "operation" : "Query",
    "query" : {
        "expression": "pk = :pk",
        "expressionValues" : {
            ":pk" : {
                "S" : "SentimentScore"
            }
        }
    },
    "limit": $util.defaultIfNull($ctx.args.limit, 10),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($ctx.args.nextToken, null))
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
{
    "items": $util.toJson($ctx.result.items),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($context.result.nextToken, null))
}
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "create_syntax_token" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createSyntaxToken"
  request_template  = <<EOF
#set($id = $util.autoId())
#set($createdDate = $util.time.nowISO8601())
#set($pk = "SyntaxToken")
#set($sk = $id)
#set($updatedDate = $createdDate)
{
    "version" : "2018-05-29",
    "operation" : "PutItem",
    "key" : {
        "pk": $util.dynamodb.toDynamoDBJson($pk),
        "sk": $util.dynamodb.toDynamoDBJson($sk)
    },
    "attributeValues" : {
        "beginOffset": $util.dynamodb.toDynamoDBJson($ctx.args.input.beginOffset),
        "createdDate": $util.dynamodb.toDynamoDBJson($createdDate),
        "endOffset": $util.dynamodb.toDynamoDBJson($ctx.args.input.endOffset),
        "id": $util.dynamodb.toDynamoDBJson($id),
        "order": $util.dynamodb.toDynamoDBJson($ctx.args.input.order),
        "quoteId": $util.dynamodb.toDynamoDBJson($ctx.args.input.quoteId),
        "text": $util.dynamodb.toDynamoDBJson($ctx.args.input.text),
        "tokenId": $util.dynamodb.toDynamoDBJson($ctx.args.input.tokenId),
        "updatedDate": $util.dynamodb.toDynamoDBJson($updatedDate),
    }
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_syntax_token" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSyntaxToken"
  request_template  = <<EOF
{
    "version": "2018-05-29",
    "operation": "Query",
    "query": {
        "expression": "pk = :pk and sk = :sk",
        "expressionValues": {
            ":pk": $util.dynamodb.toDynamoDBJson("SyntaxToken"),
            ":sk": $util.dynamodb.toDynamoDBJson($ctx.args.id)
        }
    },
    "scanIndexForward": false
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "get_syntax_tokens" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSyntaxTokens"
  request_template  = <<EOF
{
    "version" : "2017-02-28",
    "operation" : "Query",
    "query" : {
        "expression": "pk = :pk",
        "expressionValues" : {
            ":pk" : {
                "S" : "SyntaxToken"
            }
        }
    },
    "limit": $util.defaultIfNull($ctx.args.limit, 10),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($ctx.args.nextToken, null))
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
{
    "items": $util.toJson($ctx.result.items),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($context.result.nextToken, null))
}
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "create_syntax_token_part_of_speech" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createSyntaxTokenPartOfSpeech"
  request_template  = <<EOF
#set($id = $util.autoId())
#set($createdDate = $util.time.nowISO8601())
#set($pk = "SyntaxTokenPartOfSpeech")
#set($sk = $id)
#set($updatedDate = $createdDate)
{
    "version" : "2018-05-29",
    "operation" : "PutItem",
    "key" : {
        "pk": $util.dynamodb.toDynamoDBJson($pk),
        "sk": $util.dynamodb.toDynamoDBJson($sk)
    },
    "attributeValues" : {
        "createdDate": $util.dynamodb.toDynamoDBJson($createdDate),
        "id": $util.dynamodb.toDynamoDBJson($id),
        "score": $util.dynamodb.toDynamoDBJson($ctx.args.input.score),
        "syntaxTokenId": $util.dynamodb.toDynamoDBJson($ctx.args.input.syntaxTokenId),
        "tag": $util.dynamodb.toDynamoDBJson($ctx.args.input.tag),
        "updatedDate": $util.dynamodb.toDynamoDBJson($updatedDate),
    }
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Mutation"
}

resource "aws_appsync_resolver" "get_syntax_token_part_of_speech" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSyntaxTokenPartOfSpeech"
  request_template  = <<EOF
{
    "version": "2018-05-29",
    "operation": "Query",
    "query": {
        "expression": "pk = :pk and sk = :sk",
        "expressionValues": {
            ":pk": $util.dynamodb.toDynamoDBJson("SyntaxTokenPartOfSpeech"),
            ":sk": $util.dynamodb.toDynamoDBJson($ctx.args.id)
        }
    },
    "scanIndexForward": false
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
$util.toJson($ctx.result)
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "get_syntax_token_part_of_speechs" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getSyntaxTokenPartOfSpeechs"
  request_template  = <<EOF
{
    "version" : "2017-02-28",
    "operation" : "Query",
    "query" : {
        "expression": "pk = :pk",
        "expressionValues" : {
            ":pk" : {
                "S" : "SyntaxTokenPartOfSpeech"
            }
        }
    },
    "limit": $util.defaultIfNull($ctx.args.limit, 10),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($ctx.args.nextToken, null))
}
EOF
  response_template = <<EOF
#if($ctx.error)
    $util.error($ctx.error.message, $ctx.error.type)
#end
{
    "items": $util.toJson($ctx.result.items),
    "nextToken": $util.toJson($util.defaultIfNullOrBlank($context.result.nextToken, null))
}
EOF
  type              = "Query"
}
