
#VPC
resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"
  tags = {
      Name = "vpc"
      project = "${var.project_name}"
      env="${var.env}"
  }
}

#public subnet
resource "aws_subnet" "subnet-public" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.subnet_public_cidr}"
  map_public_ip_on_launch = "true"
  tags = {
      Name = "subnet-public"
      project = "${var.project_name}"
      env="${var.env}"
  }
}
#private subnet
resource "aws_subnet" "subnet-private" {
  vpc_id = "${var.vpc_id}"
  cidr_block = "${var.subnet_private_cidr}"
  tags = {
      Name = "subnet-private"
      project = "${var.project_name}"
      env="${var.env}"
  }
}


