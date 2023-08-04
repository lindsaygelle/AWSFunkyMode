resource "aws_appsync_datasource" "main" {
  api_id      = aws_appsync_graphql_api.main.id
  description = "DataSource for Amazon DynamoDB table ${aws_dynamodb_table.main.name} (${aws_dynamodb_table.main.arn})"
  dynamodb_config {
    table_name = aws_dynamodb_table.main.name
  }
  name             = var.application
  service_role_arn = aws_iam_role.app_sync.arn
  type             = "AMAZON_DYNAMODB"
}
