resource aws_cloudwatch_log_group "test" {
  name       = "examplea"
  kms_key_id = aws_kms_key.foo.arn
}
