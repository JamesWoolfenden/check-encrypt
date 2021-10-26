resource "aws_sagemaker_endpoint_configuration" "test" {
  name = "examplea"

  production_variants {
    variant_name           = "variant-1"
    model_name             = aws_sagemaker_model.test.name
    initial_instance_count = 2
    instance_type          = "ml.t2.medium"
    initial_variant_weight = 1
  }

  async_inference_config {
    output_config {
      s3_output_path = "s3://${aws_s3_bucket.test.bucket}/"
      kms_key_id     = aws_kms_key.test.arn
    }
  }
}
