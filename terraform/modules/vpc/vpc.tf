#VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  instance_tenancy = var.tenancy
  tags = {
      Name = "main"
      project = "${var.project_name}"
      env="${var.env}"
  }
}

# Subnets
resource "aws_subnet" "subnet-public" {
    count = "${length(data.aws_availability_zones.azs.names)}"
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${element(var.subnet_public_cidr, count.index)}"
    map_public_ip_on_launch = "true"
    availability_zone = "${data.aws_availability_zones.azs.names[count.index]}"
    tags =  {
        Name = "subnet-public-${count.index}"
    }
}
resource "aws_subnet" "subnet-private" {
    count = "${length(data.aws_availability_zones.azs.names)}"
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "${element(var.subnet_private_cidr, count.index)}"
    map_public_ip_on_launch = "false"
    availability_zone = "${data.aws_availability_zones.azs.names[count.index]}"
    tags =  {
        Name = "subnet-private-${count.index}"
    }
}
# Internet GW
resource "aws_internet_gateway" "main-gw" {
    vpc_id = "${aws_vpc.main.id}"
    tags  = {
        Name = "main"
    }
}

# route tables
resource "aws_route_table" "main-public-rt" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.main-gw.id}"
    }
    tags  = {
        Name = "main-public-rt"
    }
}

# route associations public
resource "aws_route_table_association" "main-public-rta" {
    count = "${length(data.aws_availability_zones.azs.names)}"
    subnet_id = "${element(aws_subnet.subnet-public, count.index).id}"
    
    route_table_id = "${aws_route_table.main-public-rt.id}"
}
resource "aws_route_table" "main-private-rt" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
    }
    tags  = {
        Name = "main-private-rt"
    }
}

# route associations private
resource "aws_route_table_association" "main-private-rta" {
    count = "${length(data.aws_availability_zones.azs.names)}"
    subnet_id = "${element(aws_subnet.subnet-private, count.index).id}"
    route_table_id = "${aws_route_table.main-private-rt.id}"
}

# nat gw
resource "aws_eip" "nat" {
  vpc      = true
}
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id = "${aws_subnet.subnet-public[0].id}"
  depends_on = ["aws_internet_gateway.main-gw"]
}
