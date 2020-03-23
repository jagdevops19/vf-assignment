resource "aws_elastic_beanstalk_application" "vf-app" {
  name = "vf-app"
  description = "vf-app"
}

resource "aws_elastic_beanstalk_environment" "vf-app-dev" {
  name = "vf-app-dev"
  application = "${aws_elastic_beanstalk_application.vf-app.name}"
  solution_stack_name = var.solution_stack_name
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "${aws_vpc.main.id}"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = "${aws_subnet.main-private-1.id},${aws_subnet.main-private-2.id}"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "AssociatePublicIpAddress"
    value = "false"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "${aws_iam_instance_profile.vf-app-ec2-role.name}"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "SecurityGroups"
    value = "${aws_security_group.allow-vf-app.id}"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "EC2KeyName"
    value = "${aws_key_pair.vf-keypair.id}"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "t2.micro"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name = "ServiceRole"
    value = "${aws_iam_role.vf-elasticbeanstalk-service-role.name}"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "ELBScheme"
    value = "public"
  }
  setting {
    namespace = "aws:ec2:vpc"
    name = "ELBSubnets"
    value = "${aws_subnet.main-public-1.id},${aws_subnet.main-public-2.id}"
  }
  setting {
    namespace = "aws:elb:loadbalancer"
    name = "CrossZone"
    value = "true"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSize"
    value = "30"
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name = "BatchSizeType"
    value = "Percentage"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name = "Availability Zones"
    value = "Any 2"
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name = "MinSize"
    value = "1"
  }
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name = "RollingUpdateType"
    value = "Health"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_USERNAME"
    value = "${aws_db_instance.postgres.username}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_PASSWORD"
    value = "${aws_db_instance.postgres.password}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_DATABASE"
    value = "${aws_db_instance.postgres.name}"
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "RDS_HOSTNAME"
    value = "${aws_db_instance.postgres.endpoint}"
  }
}

