provider "aws" {
  region = "ap-south-1"  # Change this to your desired region
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
  name = "example-instance-profile-new"  # New name for the instance profile
  role = aws_iam_role.example_role.name
}

provider "aws" {
  region = "ap-south-1"  # Change this to your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-0a7cf821b91bcccbc"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance1"
  }
}

}
