resource "aws_cognito_user_pool" "main" {
  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }
  admin_create_user_config {
    allow_admin_create_user_only = false
    invite_message_template {
      email_message = file("./src/cognito/user_pool/email/invite_message.html")
      email_subject = "${var.application} invitation"
      sms_message   = file("./src/cognito/user_pool/sms/invite_message.txt")
    }
  }
  auto_verified_attributes = [
    "email"
  ]
  deletion_protection = local.environment == "production" ? "ACTIVE" : "INACTIVE"
  email_configuration {

  }
  name = var.application
  password_policy {
    minimum_length                   = 10
    require_lowercase                = true
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 1
  }
  tags_all = local.tags_all
  user_attribute_update_settings {
    attributes_require_verification_before_update = [
      "email"
    ]
  }
  username_attributes = [
    "email"
  ]
  username_configuration {
    case_sensitive = false
  }
  verification_message_template {
    default_email_option  = "CONFIRM_WITH_CODE"
    email_message         = file("./src/cognito/user_pool/email/verification_message.html")
    email_subject         = "${var.application} verification"
    email_subject_by_link = "New register to ${var.application}"
    sms_message           = file("./src/cognito/user_pool/sms/verification_message.txt")
  }
}
