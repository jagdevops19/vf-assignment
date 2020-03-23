module "assignment_ebs" {
  source = "../modules/elasticbeanstalk"
  # VPC
  AWS_REGION = "eu-west-2"
  vpc_cidr = "170.0.0.0/16"
  main_public_1_cidr="170.0.1.0/24"
  main_public_2_cidr="170.0.2.0/24"
  main_public_3_cidr="170.0.3.0/24"
  main_private_1_cidr="170.0.4.0/24"
  main_private_2_cidr="170.0.5.0/24"
  main_private_3_cidr="170.0.6.0/24"
  tenancy = "default"
  project_name = "assignment"
  env = "dev"
  PATH_TO_PUBLIC_KEY = "C://assignment/vf-keypair.pub"
  #ElasticBeanStalk
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.10.3 running Java 8"
  #RDS-postgres
  db_allocated_storage    = 20   # 20 GB of storage, gives us more IOPS than a lower number
  db_engine               = "postgres"
  db_family               = "postgres9.6"
  db_engine_version       = "9.6"
  db_instance_class       = "db.t2.micro"    # use micro if you want to use the free tier
  db_identifier           = "postgres"
  db_name                 = "VFassignment"
  db_username             = "postgres"   # username
  db_password             = "assignment" # password
  db_port                 = "5432"
  db_multi_az             = "false"     # set to true to have high availability: 2 instances synchronized with each other
  db_storage_type         = "gp2"
  db_backup_retention_period = 0    # how long youâ€™re going to keep your backups
  db_skip_final_snapshot = true   # skip final snapshot when doing terraform destroy
  #ASG
  image_id = "ami-3be2e85f"
  instance_type = "t2.micro"
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
