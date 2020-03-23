module "assignment_vpc" {
  source = "../modules/vpc"

  vpc_cidr = "10.0.0.0/16"
  subnet_public_cidr = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
  subnet_private_cidr = ["10.0.4.0/24","10.0.5.0/24","10.0.6.0/24"]
  tenancy = "default"
  //vpc_id = "${module.assignment_vpc.vpc_id}"
  project_name = "assignment"
  env = "dev"
}
module "assignment_security_groups" {
  source = "../modules/security-group"

  vpc_id = "${module.assignment_vpc.vpc_id}"
  
}
/*
module "slate-remote-state" {
  source = "../modules/remote-state"
  
  bucket_name = "s3-tf-state-remote"
  dynamo_name = "dynamodb-tf-state-lock"
  project_name = "assignment"
  environment = "dev"
  key = "s3-dev/terraform.tfstate"
}
*/
/*
module "assignment_ebs" {
  source = "../modules/ebs"
  
  vpc_id = "${module.assignment_vpc.vpc_id}"
  private_subnet_ids = "${module.assignment_vpc.private_subnet_ids}"
  public_subnet_id = "${module.assignment_vpc.subnet_public_id}"
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.10.3 running Java 8"
  security_groups = "${module.assignment_vpc.sg_allow_ssh_id},${module.assignment_vpc.sg_allow_http_id},${module.assignment_vpc.sg_allow_https_id}"
  PATH_TO_PUBLIC_KEY = "C://assignment/vf-keypair.pub"
  */
/*
  rds_name="${module.assignment_rds.db_instance_name}"
  rds_username="${module.assignment_rds.db_username}"
  rds_password="${module.assignment_rds.db_password}"
  rds_endpoint="${module.assignment_rds.db_instance_endpoint}"
  */
//}

data aws_availability_zones "azs"{}
module "assignment_rds" {
  source = "../modules/rds"
  
  allocated_storage    = 20   # 20 GB of storage, gives us more IOPS than a lower number
  engine               = "postgres"
  engine_version       = "9.6"
  instance_class       = "db.t2.micro"    # use micro if you want to use the free tier
  identifier           = "postgres"
  name                 = "VFassignment"
  username             = "postgres"   # username
  password             = "assignment" # password
  port                 = "5432"
  subnet_ids           =  "${module.assignment_vpc.subnet_private_ids}"
  multi_az             = "false"     # set to true to have high availability: 2 instances synchronized with each other
  vpc_security_group_ids = ["${module.assignment_security_groups.sg_allow_postgresdb_id}"]
  availability_zone = "${module.assignment_vpc.subnet_private_az}"
  storage_type         = "gp2"
  backup_retention_period = 0    # how long youâ€™re going to keep your backups
  skip_final_snapshot = true   # skip final snapshot when doing terraform destroy
}

