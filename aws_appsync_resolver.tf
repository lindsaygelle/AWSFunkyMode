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
