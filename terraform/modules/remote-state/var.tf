variable "bucket_name" {
    default = "s3-tf-state-remote"
}
variable "dynamo_name" {
  default = "dynamodb-tf-state-lock"
}

variable "acl" {
  default = "private"
}
variable "project_name" {
    
}

variable "environment" {
  default = "dev"
}
variable "key" {
  default = "global/s3/terraform.tfstate"
}

