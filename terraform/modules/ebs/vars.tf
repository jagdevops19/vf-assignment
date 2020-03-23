variable "vpc_id" {}
variable "solution_stack_name" {  
}
variable "security_groups"{
}
/*
variable "security_groups" {
  description = "List of VPC private subnet ids"
  type        = list(string)
  default     = []
}*/
variable "PATH_TO_PUBLIC_KEY" {
  default="C://assignment//vf-keypair.pub"
}
variable "private_subnet_ids" {}

/*
variable "private_subnet_ids" {
  description = "List of VPC private subnet ids"
  type        = list(string)
  default     = []
}*/

variable "public_subnet_id"{}
/*
variable "rds_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
  default     = ""
}

variable "rds_username" {
  description = "Username for the master DB user"
  type        = string
}

variable "rds_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
}
variable "rds_endpoint"{}
*/