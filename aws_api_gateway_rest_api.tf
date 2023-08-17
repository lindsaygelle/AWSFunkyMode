resource "aws_api_gateway_rest_api" "main" {
  description = "REST API for ${var.application}."
  endpoint_configuration {
    types = [
      "REGIONAL"
    ]
  }
  name     = var.application
  tags_all = local.tags_all
}
