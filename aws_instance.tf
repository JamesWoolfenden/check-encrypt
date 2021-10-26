resource "aws_instance" "test" {
  ami           = data.aws_ami.amzn-ami-minimal-hvm-ebs.id
  instance_type = "t3.medium"

  root_block_device {
    volume_type = "gp2"
    volume_size = 11
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    encrypted   = true
    kms_key_id  = aws_kms_key.test.arn
    volume_size = 9
  }
}