terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.26.0"
    }
  }
}


provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAVAMZOIP62YHN4BQP"
  secret_key = "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"
}

resource "aws_instance" "aamir-apache-ec2" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name = "aamir-apache-EC2"
  }
  user_data = <<EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install apache2 -y
    sudo systemctl start apache2
  EOF
}
