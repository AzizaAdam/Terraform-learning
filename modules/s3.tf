resource "aws_s3_bucket" "s3dev" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "bucketDev"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.s3dev.id
  acl    = "private"
}
