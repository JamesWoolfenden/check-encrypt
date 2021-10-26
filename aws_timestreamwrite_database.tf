resource "aws_timestreamwrite_database" "test" {
  database_name = "examplea"
  kms_key_id    = aws_kms_key.test.arn
}