output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "subnet_public_id" {
  value = "${aws_subnet.subnet-public.id}"
}
output "subnet_private_id" {
  value = "${aws_subnet.subnet-private.id}"
}

output "sg_allow_ssh_id" {
  value = "${aws_security_group.allow-ssh.id}"
}
output "sg_allow_http" {
  value = "${aws_security_group.allow-http.id}"
}
output "sg_allow_https" {
  value = "${aws_security_group.allow-https.id}"
}