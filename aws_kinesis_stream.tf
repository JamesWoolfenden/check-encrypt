resource "aws_kinesis_stream" "test" {
  name            = "test_stream-%[1]d"
  shard_count     = 1
  encryption_type = "KMS"
  kms_key_id      = aws_kms_key.sse_aws_kms_key_id.id
}