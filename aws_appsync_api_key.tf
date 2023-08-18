resource "aws_appsync_api_key" "main" {
  api_id = aws_appsync_graphql_api.main.id
}
