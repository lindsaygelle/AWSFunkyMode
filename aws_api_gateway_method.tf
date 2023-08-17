resource "aws_api_gateway_method" "console_GET" {
  api_key_required     = false
  authorization        = "NONE"
  authorization_scopes = []
  http_method          = "GET"
  resource_id          = aws_api_gateway_resource.console.id
  rest_api_id          = aws_api_gateway_resource.console.rest_api_id
  request_models       = {}
  request_parameters = {
    "method.request.querystring.nextToken" = false
  }
}
