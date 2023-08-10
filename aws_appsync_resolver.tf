resource "aws_appsync_resolver" "dynamo_db_get_item_console" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getConsole"
  request_template  = <<EOF
{
    "version" : "2017-02-28",
    "operation": "GetItem",
    "key": {
        "PartitionKey": $util.dynamodb.toDynamoDBJson("Console"),
        "SortKey": $util.dynamodb.toDynamoDBJson("Console#$ctx.arguments.input.ID&Metadata"),
    }
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

resource "aws_appsync_resolver" "dynamo_db_get_item_game" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getGame"
  request_template  = <<EOF
{
    "version" : "2017-02-28",
    "operation": "GetItem",
    "key": {
        "PartitionKey": $util.dynamodb.toDynamoDBJson("Game"),
        "SortKey": $util.dynamodb.toDynamoDBJson("Game#$ctx.arguments.input.ID&Metadata"),
    }
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
