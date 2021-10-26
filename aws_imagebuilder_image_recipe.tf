resource "aws_imagebuilder_image_recipe" "test" {
  block_device_mapping {
    ebs {
      kms_key_id = aws_kms_key.test.arn
    }
  }

  component {
    component_arn = aws_imagebuilder_component.test.arn
  }

  name         = %[1]q
  parent_image = "arn:${data.aws_partition.current.partition}:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2-x86/x.x.x"
  version      = "1.0.0"
}