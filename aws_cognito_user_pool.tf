resource "aws_cognito_user_pool" "test" {
  name = "examplea"

  lambda_config {
    kms_key_id = aws_kms_key.test.arn

    custom_email_sender {
      lambda_arn     = aws_lambda_function.test.arn
      lambda_version = "V1_0"
    }
  }
}
