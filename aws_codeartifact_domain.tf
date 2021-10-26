resource "aws_codeartifact_domain" "test" {
    encryption_key = aws_kms_key.test.arn
}  