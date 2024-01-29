provider "aws" {
  region = "ap-south-1"  # Set your desired AWS region
  access_key = "AKIA2QGZ7CMJCH3OX6OT"
  secret_key = "YFSTZfZHaFzwWxRIZmVi+/IjnseTOMBmHwyHCKQ6"
}

resource "aws_instance" "example" {
  ami           = "ami-0a7cf821b91bcccbc"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}

