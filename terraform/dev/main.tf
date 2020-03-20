module "assignment_vpc" {
  source = "../modules/vpc"
  
  vpc_cidr = "198.120.0.0/16"
  subnet_cidr = "198.120.1.0/24"
  tenancy = "default"
  vpc_id = "${module.assignment_vpc.vpc_id}"
  project_name = "assignment"
}

