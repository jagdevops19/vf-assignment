resource "aws_db_subnet_group" "postgres-subnet-group" {
    name = "postgres-subnet-group"
    description = "RDS private subnet group"
    subnet_ids = ["${aws_subnet.main-private-1.id}","${aws_subnet.main-private-2.id}"]
}

resource "aws_db_parameter_group" "postgres-parameters-group" {
    name = "postgres-parameters-group"
    family = var.db_family
    description = "postgres parameter group"
    
}


resource "aws_db_instance" "postgres" {
  
  allocated_storage    = var.db_allocated_storage//20   # GB of storage, gives us more IOPS than a lower number
  engine               = var.db_engine//"postgres"
  engine_version       = var.db_engine_version//"9.6"
  instance_class       = var.db_instance_class//"db.t2.micro"    # use micro if you want to use the free tier
  identifier           = var.db_identifier//"vfassignment"
  name                 = var.db_name//"vfassignment"
  username             = var.db_username// "postgres"    # username
  password             = var.db_password//"assignment"# password
  port                 = var.db_port//"5432"
  db_subnet_group_name = "${aws_db_subnet_group.postgres-subnet-group.name}"
  parameter_group_name = "${aws_db_parameter_group.postgres-parameters-group.name}"
  multi_az             = var.db_multi_az//"false"     # set to true to have high availability: 2 instances synchronized with each other
  vpc_security_group_ids = ["${aws_security_group.allow-postgres.id}"]
  storage_type         = var.db_storage_type//"gp2"
  backup_retention_period = var.db_backup_retention_period//0 # how long you�re going to keep your backups
  availability_zone = "${aws_subnet.main-private-1.availability_zone}"   # prefered AZ
  skip_final_snapshot = var.db_skip_final_snapshot//true   # skip final snapshot when doing terraform destroy
  tags = {
      Name = "postgres"
  }
}

