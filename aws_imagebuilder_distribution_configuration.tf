resource "aws_imagebuilder_distribution_configuration" "test" {
  name = "examplea"

  distribution {
    ami_distribution_configuration {
      kms_key_id = aws_kms_key.test.arn
    }

    region = data.aws_region.current.name
  }
}