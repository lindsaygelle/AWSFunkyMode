resource "aws_appsync_resolver" "get_user" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getUser"
  request_template  = file("./src/app_sync/graphql/resolver/dynamo_db/get_item/request/template.vtl")
  response_template = file("./src/app_sync/graphql/resolver/dynamo_db/get_item/response/template.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "get_users" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "getUsers"
  request_template  = file("./src/app_sync/graphql/resolver/dynamo_db/scan/request/template.vtl")
  response_template = file("./src/app_sync/graphql/resolver/dynamo_db/scan/response/template.vtl")
  type              = "Query"
}

resource "aws_appsync_resolver" "put_user" {
  api_id            = aws_appsync_graphql_api.main.id
  data_source       = aws_appsync_datasource.main.name
  field             = "createUser"
  request_template  = file("./src/app_sync/graphql/resolver/dynamo_db/put_item/request/template.vtl")
  response_template = file("./src/app_sync/graphql/resolver/dynamo_db/put_item/response/template.vtl")
  type              = "Mutation"
}
