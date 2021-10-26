resource "aws_secretsmanager_secret" "test" {
  name       = "AmazonMSK_somekey"
  kms_key_id = aws_kms_key.test[count.index].id
}