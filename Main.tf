provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAZWCJP5G7XSNAG555"
  secret_key = "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"
}

resource "aws_instance" "aamir-apache-ec2" {
  ami                         = "ami-053b0d53c279acc90"
  instance_type               = "t2.micro"
  
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