resource "aws_security_group" "allow-vf-app" {
  vpc_id = "${aws_vpc.main.id}"
  name = "allow-vf-app"
  description = "security group that allows http and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
    Name = "allow-vf-app"
    Assign = "app-frontend"
  }
}
resource "aws_security_group" "allow-ssh" {
  vpc_id = "${aws_vpc.main.id}"
  name = "allow-ssh"
  description = "security group for my app"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 
  tags= {
    Name = "allow-ssh"
     Assign = "app-frontend"
  }
}
resource "aws_security_group" "allow-http" {
  vpc_id = "${aws_vpc.main.id}"
  name = "allow-http"
  description = "security group that allows http and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
    Name = "allow-http"
    Assign = "app-frontend"
  }
}
resource "aws_security_group" "allow-postgres" {
  vpc_id = "${aws_vpc.main.id}"
  name = "allow-postgres"
  description = "allow-postgres"
  ingress {
      from_port = 5432
      to_port = 5432
      protocol = "tcp"
      security_groups = ["${aws_security_group.allow-vf-app.id}"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      self = true
  }
  tags = {
    Name = "allow-postgres"
  }
}