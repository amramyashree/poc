provider "aws" {
  region = "ap-southeast-1"  # Change this to your desired region
}

resource "aws_iam_role" "example_role" {
  name               = "example-role"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })

  # Add policies or permissions as needed
}

resource "aws_iam_instance_profile" "example_instance_profile" {
  name = "example-instance-profile-newname1"
  role = aws_iam_role.example_role.name
}

resource "aws_instance" "my-instance" {
  ami                    = "ami-03caf91bb3d81b843"
  instance_type          = "t2.micro"
  ebs_optimized          = true

  root_block_device {
    encrypted = true
  }

  metadata_options {
    http_tokens = "required"
    http_put_response_hop_limit = 2
  }

  monitoring = true

  iam_instance_profile   = aws_iam_instance_profile.example_instance_profile.name

  tags = {
    Name = "ExampleInstance1"
  }
}
