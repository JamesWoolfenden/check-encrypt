resource "aws_emr_cluster" "test" {
  name          = "examplea"
  release_label = "emr-5.32.0"
  applications  = ["Spark"]

  termination_protection            = false
  keep_job_flow_alive_when_no_steps = true

  master_instance_group {
    instance_type = "c4.large"
  }

  core_instance_group {
    instance_count = 1
    instance_type  = "c4.large"
  }

  log_encryption_kms_key_id = aws_kms_key.test.arn
  log_uri                   = "s3://${aws_s3_bucket.test.bucket}/"

  ec2_attributes {
    instance_profile                  = aws_iam_instance_profile.emr_instance_profile.arn
    emr_managed_master_security_group = aws_security_group.test.id
    emr_managed_slave_security_group  = aws_security_group.test.id
    subnet_id                         = aws_subnet.test.id
  }

  service_role = aws_iam_role.emr_service.arn
}
