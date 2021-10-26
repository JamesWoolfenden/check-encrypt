
resource "aws_s3_bucket_object" "object" {
  bucket       = aws_s3_bucket.object_bucket.bucket
  key          = "tf-testing-obj-%[1]d-encrypted"
  content      = "Keep Calm and Carry On"
  content_type = "text/plain"
  kms_key_id   = aws_kms_key.example.arn
}