 resource "aws_lambda_function" "transaction_lambda" {
  function_name    = "TransactionProcessor"
  filename        = "D:/TerraformPOC/aws-transaction-processing/springboot-aws-lambda-0.0.1-SNAPSHOT-aws.jar"
  role            = aws_iam_role.lambda_role.arn
  handler         = "com.javatechie.aws.lambda.TransactionLambda::handleRequest"
  runtime         = "java11"

  memory_size     = 512
  timeout        = 30

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.transactions.name
    }
  }
}

