resource "aws_instance" "example" {
  ami           = "ami-0a7cf821b91bcccbc"
  instance_type = "t2.micro"
  ebs_optimized = true  # Corrected to ensure EC2 is EBS optimized

  tags = {
    Name = "ExampleInstance2"
  }

  # Adding encrypted block device configuration
  root_block_device {
    encrypted = true
  }

  # Adding detailed monitoring
  monitoring = true

  # Disabling instance metadata service version 1
  metadata_options {
    http_tokens = "required"
  }

  # IAM role attachment
  iam_instance_profile = aws_iam_instance_profile.example.name
}

resource "aws_iam_instance_profile" "example" {
  name = "example-instance-profile"
  # Define the role and policies attached to this instance profile
}


