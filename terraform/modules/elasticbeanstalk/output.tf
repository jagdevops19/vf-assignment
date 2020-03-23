output "vpc_id" {
	value = "${aws_vpc.main.id}"
}
output "eb" {
	value = "${aws_elastic_beanstalk_environment.vf-app-dev.cname}"
}
output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = "${aws_db_instance.postgres.endpoint}"
}
output "db_instance_name" {
  value       = "${aws_db_instance.postgres.name}"
}

output "db_username" {
  value       = "${aws_db_instance.postgres.username}"
}
output "db_password" {
  value       = "${aws_db_instance.postgres.password}"
}