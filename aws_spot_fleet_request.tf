resource "aws_spot_fleet_request" "test" {
  iam_fleet_role                      = aws_iam_role.test.arn
  spot_price                          = "0.05"
  target_capacity                     = 1
  terminate_instances_with_expiration = true
  valid_until                         = "01/01/2222"
  wait_for_fulfillment                = true

  launch_specification {
    ami           = data.aws_ami.amzn-ami-minimal-hvm-ebs.id
    instance_type = "t2.micro"

    ebs_block_device {
      device_name = "/dev/xvda"
      volume_type = "gp2"
      volume_size = 8
    }

    ebs_block_device {
      device_name = "/dev/xvdcz"
      encrypted   = true
      kms_key_id  = aws_kms_key.test.arn
      volume_type = "gp2"
      volume_size = 10
    }
  }

  depends_on = [aws_iam_policy_attachment.test]
}