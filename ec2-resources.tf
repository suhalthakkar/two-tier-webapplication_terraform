# Public subnet EC2 instance 1
resource "aws_instance" "two-tier-web-server-1" {
  ami             = "ami-04149c54d7c56180d"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.two-tier-ec2-sg.id]
  subnet_id       = aws_subnet.two-tier-pub-sub-1.id
  iam_instance_profile = aws_iam_instance_profile.ec2_rds_profile.name
  key_name   = "two-tier-key"

  tags = {
    Name = "two-tier-web-server-1"
  }

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y 
sudo systemctl enable nginx
sudo systemctl start nginx
EOF
}

# Public subnet  EC2 instance 2
resource "aws_instance" "two-tier-web-server-2" {
  ami             = "ami-04149c54d7c56180d"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.two-tier-ec2-sg.id]
  subnet_id       = aws_subnet.two-tier-pub-sub-2.id
  iam_instance_profile = aws_iam_instance_profile.ec2_rds_profile.name  
  key_name   = "two-tier-key"

  tags = {
    Name = "two-tier-web-server-2"
  }

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo dnf install nginx -y 
sudo systemctl enable nginx
sudo systemctl start nginx
EOF
}


resource "aws_iam_instance_profile" "ec2_rds_profile" {
  name = "ec2_rds_profile"
  role = aws_iam_role.ec2_rds_role.name
}