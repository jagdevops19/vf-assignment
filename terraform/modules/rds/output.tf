output "db_host_id" {
 value = "${aws_db_instance.postgres.id}"
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