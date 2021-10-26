resource "aws_ecs_cluster" "test" {
  name = "examplea"

  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.test.arn
      logging    = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.test.name
      }
    }
  }
}
