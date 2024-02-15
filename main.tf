provider "aws" {
  region = "ap-south-1"  # Change this to your desired region
}

resource "aws_iam_instance_profile" "example_instance_profile" {
  name = "example-instance-profile"
  role = aws_iam_role.example_role.name
}

resource "aws_iam_role" "example_role" {
  name = "example-role"
  # Add policies or permissions as needed
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

  iam_instance_profile = aws_iam_instance_profile.example_instance_profile.name

  tags = {
    Name = "ExampleInstance2"
  }
}
