# iam roles
resource "aws_iam_role" "vf-app-ec2-role" {
    name = "vf-app-ec2-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
resource "aws_iam_instance_profile" "vf-app-ec2-role" {
    name = "vf-app-ec2-role"
    role = "${aws_iam_role.vf-app-ec2-role.name}"
}

# service
resource "aws_iam_role" "vf-elasticbeanstalk-service-role" {
    name = "vf-elasticbeanstalk-service-role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "elasticbeanstalk.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# policies
resource "aws_iam_policy_attachment" "vf-app-attach1" {
    name = "vf-app-attach1"
    roles = ["${aws_iam_role.vf-app-ec2-role.name}"]
    policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}
resource "aws_iam_policy_attachment" "vf-app-attach2" {
    name = "vf-app-attach2"
    roles = ["${aws_iam_role.vf-app-ec2-role.name}"]
    policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
}
resource "aws_iam_policy_attachment" "vf-app-attach3" {
    name = "vf-app-attach3"
    roles = ["${aws_iam_role.vf-app-ec2-role.name}"]
    policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
}
resource "aws_iam_policy_attachment" "vf-app-attach4" {
    name = "vf-app-attach4"
    roles = ["${aws_iam_role.vf-elasticbeanstalk-service-role.name}"]
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"
}
