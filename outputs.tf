output "api_url" {
  description = "URL of the API Gateway"
  value       = "https://${aws_api_gateway_rest_api.api.id}.execute-api.${var.aws_region}.amazonaws.com/prod"
}

output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.get_user.function_name
}

output "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  value       = aws_dynamodb_table.users.name
}
