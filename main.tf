provider "aws" {
  region = var.aws_region
}

resource "aws_dynamodb_table" "users" {
  name         = "users"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "user_id"

  attribute {
    name = "user_id"
    type = "S"
  }
}

resource "aws_lambda_function" "get_user" {
  function_name = "get_user"
  runtime       = "python3.9"
  handler       = "user_function.lambda_handler"
  role          = var.lambda_role_arn
  filename      = "lambda.zip"
}

resource "aws_api_gateway_rest_api" "api" {
  name = "UserAPI"
}
