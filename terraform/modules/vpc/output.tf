output "vpc_id" {
  value = "${aws_vpc.main.id}"
}
output "subnet_public_ids" {
  value = ["${aws_subnet.subnet-public.*.id}"]
}
output "subnet_private_ids" {
  value = ["${aws_subnet.subnet-private.*.id}"]
}

output "subnet_private_az" {
  value = "${element(aws_subnet.subnet-private.*, 0).availability_zone}"
}
