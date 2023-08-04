resource "aws_appsync_resolver" "get_user" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getUser"
  request_template  = <<EOF
## Below example shows how to look up an item with a Primary Key of "id" from GraphQL arguments
## The helper $util.dynamodb.toDynamoDBJson automatically converts to a DynamoDB formatted request
## There is a "context" object with arguments, identity, headers, and parent field information you can access.
## It also has a shorthand notation available:
##  - $context or $ctx is the root object
##  - $ctx.arguments or $ctx.args contains arguments
##  - $ctx.identity has caller information, such as $ctx.identity.username
##  - $ctx.request.headers contains headers, such as $context.request.headers.xyz
##  - $ctx.source is a map of the parent field, for instance $ctx.source.xyz
## Read more: https://docs.aws.amazon.com/appsync/latest/devguide/resolver-mapping-template-reference.html

{
  "version": "2017-02-28",
  "operation": "GetItem",
  "key": {
    "Id": $util.dynamodb.toDynamoDBJson($ctx.args.Id)
  },
}
EOF
  response_template = <<EOF
## Pass back the result from DynamoDB. **
$util.toJson($ctx.result)
EOF
  type              = "Query"
}

resource "aws_appsync_resolver" "put_user" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createUser"
  request_template  = <<EOF
## Below example shows how to create an object from all provided GraphQL arguments
## The primary key of the object is a randomly generated UUD using the $util.autoId() utility
## Other utilities include $util.matches() for regular expressions, $util.time.nowISO8601() or
##   $util.time.nowEpochMilliSeconds() for timestamps, and even List or Map helpers like
##   $util.list.copyAndRetainAll() $util.map.copyAndRemoveAllKeys() for shallow copies
## Read more: https://docs.aws.amazon.com/appsync/latest/devguide/resolver-context-reference.html#utility-helpers-in-util

{
    "version" : "2017-02-28",
    "operation" : "PutItem",
    "key" : {
        ## If object "id" should come from GraphQL arguments, change to $util.dynamodb.toDynamoDBJson($ctx.args.id)
        "Id": $util.dynamodb.toDynamoDBJson($ctx.args.Id),
    },
    "attributeValues" : $util.dynamodb.toMapValuesJson($ctx.args)
}
EOF
  response_template = <<EOF
## Pass back the result from DynamoDB. **
$util.toJson($ctx.result)
EOF
  type              = "Mutation"
}
