provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}



# Create a spot EC2 instance
resource "aws_instance" "aamir-linux-ubuntu" {
  ami                            = "ami-08a52ddb321b32a8c"
  instance_type                  = "t2.micro"  # Choose an appropriate instance type for spot instances
  
  user_data = <<-EOF
    #!/bin/bash
    sudo su
    yum update -y
    yum install httpd -y
    echo "<html><h1> Welcome to Whizlabs Server</h1><html>" >> /var/www/html/index.html
    systemctl start httpd
    systemctl enable httpd
    EOF

  tags = {
    Name = "Aamir-Linux-ubuntu"
  }
}

