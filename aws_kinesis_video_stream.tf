resource "aws_kinesis_video_stream" "default" {
  name = "terraform-kinesis-video-stream-test"

  data_retention_in_hours = 1
  device_name             = "kinesis-video-device-name"
  kms_key_id              = aws_kms_key.default.id
}