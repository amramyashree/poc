provider "aws" {
  region = "ap-south-1"  # Change this to your desired region
  assume_role {
    role_arn = "arn:aws:iam::722011624210:role/github_actions_workflow"
    session_name = "TerraformSession"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0a7cf821b91bcccbc"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}

