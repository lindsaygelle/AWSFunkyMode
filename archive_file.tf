data "archive_file" "cognito_user_pool_post_authentication" {
  output_path = "./src/cognito/user_pool/lambda_trigger/authentication/post/lambda.zip"
  source_dir  = "./src/cognito/user_pool/lambda_trigger/authentication/post/src"
  type        = "zip"
}

data "archive_file" "cognito_user_pool_pre_authentication" {
  output_path = "./src/cognito/user_pool/lambda_trigger/authentication/pre/lambda.zip"
  source_dir  = "./src/cognito/user_pool/lambda_trigger/authentication/pre/src"
  type        = "zip"
}

data "archive_file" "cognito_user_pool_post_sign_up" {
  output_path = "./src/cognito/user_pool/lambda_trigger/sign_up/post/lambda.zip"
  source_dir  = "./src/cognito/user_pool/lambda_trigger/sign_up/post/src"
  type        = "zip"
}

data "archive_file" "cognito_user_pool_pre_sign_up" {
  output_path = "./src/cognito/user_pool/lambda_trigger/sign_up/pre/lambda.zip"
  source_dir  = "./src/cognito/user_pool/lambda_trigger/sign_up/pre/src"
  type        = "zip"
}
