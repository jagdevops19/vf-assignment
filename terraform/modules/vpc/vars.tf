variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "subnet_public_cidr" {
  default = "10.0.1.0/24"
}
variable "subnet_private_cidr" {
  default = "10.0.1.0/24"
}

variable "vpc_id" {}

variable "tenancy" {
  default = "default"
}

variable "project_name" {
}

variable "env" {
  default = "dev"
}








