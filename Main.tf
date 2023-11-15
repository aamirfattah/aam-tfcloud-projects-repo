provider "aws" {
  access_key = var.TF_VAR_AWS_ACCESS_KEY_ID
  secret_key = var.TF_VAR_AWS_SECRET_ACCESS_KEY
  region     = var.TF_VAR_AWS_DEFAULT_REGION
}



# Create a EC2 instance
resource "aws_instance" "aamir-linux-ubuntu" {
  ami                            = "ami-0fc5d935ebf8bc3bc"
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

