provider "aws" {
  region = "eu-west-2"
}

# Get latest snapshot from production DB
data "aws_db_snapshot" "db_snapshot" {
    most_recent = true
    db_instance_identifier = "db-prod"
}
# Create new staging DB
resource "aws_db_instance" "db_uat" {
  instance_class       = "db.t2.micro"
  identifier           = "db-uat"
  username             = "xxx"
  password             = "xxx"
  db_subnet_group_name = "db-private-subnet"
  snapshot_identifier  = "${data.aws_db_snapshot.db_snapshot.id}"
  vpc_security_group_ids = ["sg-4fd43532"]
  skip_final_snapshot = true
}