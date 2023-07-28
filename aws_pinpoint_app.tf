resource "aws_pinpoint_app" "main" {
  name     = var.application
  tags_all = local.tags_all
}
