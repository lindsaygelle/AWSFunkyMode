resource "aws_appsync_datasource" "user" {
  api_id = aws_appsync_graphql_api.main.id
  dynamodb_config {
    table_name = aws_dynamodb_table.user.name
  }
  name             = "${var.application}User"
  service_role_arn = aws_iam_role.app_sync.arn
  type             = "AMAZON_DYNAMODB"
}
