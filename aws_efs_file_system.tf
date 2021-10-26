resource "aws_efs_file_system" "test" {
  encrypted  = true
  kms_key_id = aws_kms_key.test.arn
}