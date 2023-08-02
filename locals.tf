locals {
  // environment is the current workspace environment. Assumes "default" is the "production" workspace, unless specified otherwise.
  environment = terraform.workspace == "default" ? "production" : terraform.workspace
}

locals {
  # is_production reflects whether the current workspace is set to "production".
  is_production = local.environment == "production"
  # tags_all are tags to be assigned to all resources.
  tags_all = {
    application = var.application
    environment = local.environment
    region      = var.region
  }
}
