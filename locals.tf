locals {
  // environment is the current workspace environment. Assumes "default" is the "production" workspace, unless specified otherwise.
  environment = terraform.workspace == "default" ? "production" : terraform.workspace
}

locals {
  # tags_all are tags to be assigned to all resources.
  tags_all = {
    application = var.application
    environment = local.environment
    region      = var.region
  }
}
