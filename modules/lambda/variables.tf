variable "role_name" {
  description = "Name for the IAM role associated with the Lambda function"
}

variable "assume_role_policy" {
  description = "IAM policy document specifying who can assume the role"
  type        = any
  default     = {
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  }
}

variable "function_name" {
  description = "Name for the Lambda function"
}

variable "runtime" {
  description = "Runtime for the Lambda function (e.g., nodejs14.x)"
}

variable "handler" {
  description = "Handler for the Lambda function (e.g., index.handler)"
}

variable "filename" {
  description = "Path to the deployment package of the Lambda function"
}

variable "environment_vars" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}

# variable "event_source_arns" {
#   description = "ARNs of the event sources triggering the Lambda function"
#   type        = list(string)
# }

variable "event_bucket_name" {
  description = "Name of the S3 bucket for event trigger"
}
