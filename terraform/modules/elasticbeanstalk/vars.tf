variable "AWS_REGION" {
  default = "eu-west-2"
}
variable "PATH_TO_PUBLIC_KEY" {
  default="C://assignment//vf-keypair.pub"
}
variable vpc_cidr{}
variable "tenancy" {
  default = "default"
}
variable main_public_1_cidr{}

variable main_public_2_cidr{}
variable main_public_3_cidr{}
variable main_private_1_cidr{}
variable main_private_2_cidr{}
variable main_private_3_cidr{}

variable "project_name" {
}

variable "env" {
  default = "dev"
}
#ASG
variable "image_id"{}

variable  "instance_type"{
  default="t2.micro"
}
#ElasticBeanStalk
variable "solution_stack_name"{
  default ="64bit Amazon Linux 2018.03 v2.10.3 running Java 8"
}
#RDS
variable "db_identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  type        = string
}

variable "db_allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = string
}

variable "db_storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'."
  type        = string
  default     = "gp2"
}
variable "db_engine" {
  description = "The database engine to use"
  type        = string
}
variable "db_family" {
  description = "The database engine to use"
  type        = string
}
variable "db_engine_version" {
  description = "The engine version to use"
  type        = string
}
variable "db_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
  default     = ""
}

variable "db_username" {
  description = "Username for the master DB user"
  type        = string
}

variable "db_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
}

variable "db_port" {
  description = "The port on which the DB accepts connections"
  type        = string
}

variable "db_availability_zone" {
  description = "The Availability Zone of the RDS instance"
  type        = string
  default     = ""
}
variable "db_backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
  default     = 1
}
variable "db_multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = false
}
variable "db_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  type        = bool
  default     = true
}

variable "db_iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
  type        = number
  default     = 0
}

variable "db_publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  type        = bool
  default     = false
}

