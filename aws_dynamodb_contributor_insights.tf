resource "aws_dynamodb_contributor_insights" "main" {
  table_name = aws_dynamodb_table.main.name
}
