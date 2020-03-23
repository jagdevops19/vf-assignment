
resource "aws_s3_bucket" "s3-tf-state-remote" {
  bucket = "${var.bucket_name}"
  acl = "${var.acl}"
  versioning {
      enabled = true
  }
  lifecycle {
      prevent_destroy = false
  }
  tags = {
      Name = "Terraform state file"
      env = "${var.environment}"
      project = "${var.project_name}"

  }
}

resource "aws_dynamodb_table" "dynamodb-tf-state-lock" {
  name = "${var.dynamo_name}"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
  attribute {
      name = "LockID"
      type = "S"
  }
  tags = {
      Name = "DynamoDB Terraform State Lock Table"
      env = "${var.environment}"
      project = "${var.project_name}"
  }
}

terraform {
    backend "s3" {
        encrypt = "true"
        bucket = "${var.bucket_name}"
        dynamo_db_table = "${var.dynamo_name}"
        key = "${var.key_name}"
    }
}

