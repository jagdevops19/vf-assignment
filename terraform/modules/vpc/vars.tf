variable vpc_cidr{}
variable subnet_public_cidr{
  type = "list"
  default = []
}
variable subnet_private_cidr{
  type = "list"
  default = []
}
variable "tenancy" {
  default = "default"
}

variable "project_name" {
}

variable "env" {
  default = "dev"
}
data aws_availability_zones "azs"{}








