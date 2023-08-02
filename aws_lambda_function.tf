resource "aws_lambda_function" "cognito_user_pool_pre_authentication" {
  architectures = ["x86_64"]
  environment {
    variables = {
      LOG_LEVEL = "INFO"
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.cognito_user_pool_pre_authentication.output_path
  function_name    = "${var.application}CognitoUserPoolPreAuthentication"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.cognito_lambda.arn
  runtime          = "python3.9"
  source_code_hash = filebase64sha256(data.archive_file.cognito_user_pool_pre_authentication.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "cognito_user_pool_post_authentication" {
  architectures = ["x86_64"]
  environment {
    variables = {
      LOG_LEVEL = "INFO"
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.cognito_user_pool_post_authentication.output_path
  function_name    = "${var.application}CognitoUserPoolPostAuthentication"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.cognito_lambda.arn
  runtime          = "python3.9"
  source_code_hash = filebase64sha256(data.archive_file.cognito_user_pool_post_authentication.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "cognito_user_pool_post_sign_up" {
  architectures = ["x86_64"]
  environment {
    variables = {
      LOG_LEVEL = "INFO"
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.cognito_user_pool_post_sign_up.output_path
  function_name    = "${var.application}CognitoUserPoolPostSignUp"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.cognito_lambda.arn
  runtime          = "python3.9"
  source_code_hash = filebase64sha256(data.archive_file.cognito_user_pool_post_sign_up.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}

resource "aws_lambda_function" "cognito_user_pool_pre_sign_up" {
  architectures = ["x86_64"]
  environment {
    variables = {
      LOG_LEVEL = "INFO"
    }
  }
  ephemeral_storage {
    size = 512
  }
  filename         = data.archive_file.cognito_user_pool_pre_sign_up.output_path
  function_name    = "${var.application}CognitoUserPoolPreSignUp"
  handler          = "lambda.handler"
  memory_size      = 128
  role             = aws_iam_role.cognito_lambda.arn
  runtime          = "python3.9"
  source_code_hash = filebase64sha256(data.archive_file.cognito_user_pool_pre_sign_up.output_path)
  timeout          = 5
  tracing_config {
    mode = "Active"
  }
}
