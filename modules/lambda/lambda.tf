resource "aws_iam_role" "lambda_role" {
  name             = var.role_name
  assume_role_policy = jsonencode(var.assume_role_policy)
}

resource "aws_lambda_function" "lambda_function" {
  filename      = var.filename
  function_name = var.function_name
  runtime       = var.runtime
  handler       = var.handler
  role          = aws_iam_role.lambda_role.arn
  environment {
    variables = var.environment_vars
  }
}

resource "aws_lambda_permission" "event_permission" {
  statement_id  = "AllowExecutionFromS3"
  action       = "lambda:InvokeFunction"
  function_name = var.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${var.event_bucket_name}"
  # source_arn    = var.event_source_arns
}
