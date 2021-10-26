resource "aws_redshift_cluster" "test" {
  cluster_identifier                  = %[1]q
  availability_zone                   = data.aws_availability_zones.available.names[0]
  database_name                       = "mydb"
  master_username                     = "foo_test"
  master_password                     = "Mustbe8characters"
  node_type                           = "dc2.large"
  automated_snapshot_retention_period = 0
  allow_version_upgrade               = false
  skip_final_snapshot                 = true
  encrypted                           = true
  kms_key_id                          = aws_kms_key.test.arn
}