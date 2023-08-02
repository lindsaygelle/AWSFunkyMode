resource "aws_dynamodb_table" "user" {
  attribute {
    name = "user_id"
    type = "S"
  }
  billing_mode = "PROVISIONED"
  hash_key     = "user_id"
  name         = "${var.application}User"
  point_in_time_recovery {
    enabled = local.environment == "production" ? true : false
  }
  read_capacity  = 1
  table_class    = local.environment == "production" ? "STANDARD" : "STANDARD_INFREQUENT_ACCESS"
  tags_all       = local.tags_all
  write_capacity = 1
}
