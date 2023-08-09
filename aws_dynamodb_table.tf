resource "aws_dynamodb_table" "main" {
  attribute {
    name = "PartitionKey"
    type = "S"
  }
  attribute {
    name = "SortKey"
    type = "S"
  }
  billing_mode = "PROVISIONED"
  hash_key     = "PartitionKey"
  name         = var.application
  point_in_time_recovery {
    enabled = local.is_production ? true : false
  }
  range_key      = "SortKey"
  read_capacity  = 1 // TODO: Check this value.
  table_class    = local.is_production ? "STANDARD" : "STANDARD_INFREQUENT_ACCESS"
  tags_all       = local.tags_all
  write_capacity = 1 // TODO: Check this value.
}
