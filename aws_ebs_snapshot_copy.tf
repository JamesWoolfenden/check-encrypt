resource "aws_ebs_snapshot_copy" "test" {
  source_snapshot_id = aws_ebs_snapshot.test.id
  source_region      = data.aws_region.current.name
  encrypted          = true
  kms_key_id         = aws_kms_key.test.arn

  tags = {
    Name = "testAccEBSSnapshotCopyWithKMSConfig"
  }
}
