provider "aws" {
  region = "ap-south-1" // Specify your desired AWS region
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "myyyyyyyy-bucket" // Specify your desired bucket name
  acl    = "private" // Specify the ACL (Access Control List), in this case, private

  tags = {
    Name        = "ExampleBucket"
    Environment = "Production"
  }
}

