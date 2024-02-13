provider "aws" {
  region = "ap-south-1"  # Change this to your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-0a7cf821b91bcccbc"
  instance_type = "t2.micro"
  ebs_optimized = true

  root_block_device {
    encrypted = true
  }

  monitoring = true

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = "ExampleInstance2"
  }
}
