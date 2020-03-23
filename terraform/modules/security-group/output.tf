output "sg_allow_ssh_id" {
  value = "${aws_security_group.allow-ssh.id}"
}
output "sg_allow_http_id" {
  value = "${aws_security_group.allow-http.id}"
}
output "sg_allow_https_id" {
  value = "${aws_security_group.allow-https.id}"
}
output "sg_allow_postgresdb_id" {
  value = "${aws_security_group.allow-postgresdb.id}"
}