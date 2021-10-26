resource "aws_elasticsearch_domain" "test" {
  domain_name = "tf-test-%d"

  elasticsearch_version = "6.0"

  # Encrypt at rest requires m4/c4/r4/i2 instances. See http://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/aes-supported-instance-types.html
  cluster_config {
    instance_type = "m4.large.elasticsearch"
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }

  encrypt_at_rest {
    enabled    = true
    kms_key_id = aws_kms_key.es.key_id
  }
}