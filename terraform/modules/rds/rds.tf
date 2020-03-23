resource "aws_db_subnet_group" "postgres-subnet-group" {
    name = "postgres-subnet-group"
    description = "RDS private subnet group"
    subnet_ids = ["${var.subnet_ids}"]
}

resource "aws_db_parameter_group" "postgres-parameters-group" {
    name = "postgres-parameters-group"
    family = "postgres9.6"
    description = "postgres parameter group"
    
}


resource "aws_db_instance" "postgres" {
  
  allocated_storage    = var.allocated_storage    # GB of storage, gives us more IOPS than a lower number
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class    # use micro if you want to use the free tier
  identifier           = var.identifier
  name                 = var.name
  username             =  var.username  # username
  password             = var.password # password
  port                 = var.port
  db_subnet_group_name = "${aws_db_subnet_group.postgres-subnet-group.name}"
  parameter_group_name = "${aws_db_parameter_group.postgres-parameters-group.name}"
  multi_az             = "false"     # set to true to have high availability: 2 instances synchronized with each other
  vpc_security_group_ids = var.vpc_security_group_ids
  storage_type         = var.storage_type
  backup_retention_period = var.backup_retention_period    # how long you’re going to keep your backups
  availability_zone = var.availability_zone   # prefered AZ
  skip_final_snapshot = var.skip_final_snapshot   # skip final snapshot when doing terraform destroy
  tags = {
      Name = "postgres"
  }
}

