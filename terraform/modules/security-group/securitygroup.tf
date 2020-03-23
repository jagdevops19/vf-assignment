resource "aws_security_group" "allow-ssh" {
  vpc_id = var.vpc_id
  name = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
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
tags = {
    Name = "allow-ssh"
    Assign = "app-frontend"
  }
}

resource "aws_security_group" "allow-http" {
  vpc_id = var.vpc_id
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
resource "aws_security_group" "allow-https" {
  vpc_id = var.vpc_id
  name = "allow-https"
  description = "security group that allows https and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
    Name = "allow-https"
    Assign = "app-frontend"
  }
}
resource "aws_security_group" "allow-postgresdb" {
  vpc_id = var.vpc_id
  name = "allow-postgresdb"
  description = "allow-postgresdb"
  ingress {
      from_port = 5432
      to_port = 5432
      protocol = "tcp"
      security_groups = ["${aws_security_group.allow-http.id}"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      self = true
  }
  tags = {
    Name = "allow-postgresdb"
    Assign = "db-backend"
  }
}
