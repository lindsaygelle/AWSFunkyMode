// DynamoDB
resource "aws_lambda_event_source_mapping" "dynamo_db_main_stream" {
  batch_size        = 100
  enabled           = true
  event_source_arn  = aws_dynamodb_table.main.stream_arn
  function_name     = aws_lambda_function.dynamo_db_main_stream.arn
  starting_position = "LATEST"
}
