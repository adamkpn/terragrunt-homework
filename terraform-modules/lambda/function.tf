data "archive_file" "this" {
  type        = "zip"
  source_file = "function/main.js"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "this" {

  filename      = "lambda_function_payload.zip"
  function_name = "${var.env}-hello-world"

  handler = "main.handler"
  runtime = "nodejs18.x"

  role = aws_iam_role.this.arn
}

# IAM role which dictates what other AWS services the Lambda function
# may access.
resource "aws_iam_role" "this" {
  name = "${var.env}-hello-world-lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
