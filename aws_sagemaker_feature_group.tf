resource "aws_sagemaker_feature_group" "test" {
  feature_group_name             = %[1]q
  record_identifier_feature_name = %[1]q
  event_time_feature_name        = %[1]q
  role_arn                       = aws_iam_role.test.arn

  feature_definition {
    feature_name = %[1]q
    feature_type = "String"
  }

  online_store_config {
    enable_online_store = true

    security_config {
      kms_key_id = aws_kms_key.test.arn
    }
  }
}
