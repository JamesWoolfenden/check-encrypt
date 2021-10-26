resource "aws_mq_broker" "test" {
  broker_name        = "examplea"
  engine_type        = "ActiveMQ"
  engine_version     = "5.15.0"
  host_instance_type = "mq.t2.micro"
  security_groups    = [aws_security_group.test.id]

  encryption_options {
    kms_key_id        = aws_kms_key.test.arn
    use_aws_owned_key = false
  }

  logs {
    general = true
  }

  user {
    username = "Test"
    password = "TestTest1234"
  }
}