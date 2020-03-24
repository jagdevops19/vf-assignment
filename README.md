# Assignment
On Windows, install below software

1. Java 1.8.0_241, Spring-boot-2.2.5
2. Maven - 3.6.2
3. Terraform_0.12.21_windows_amd64
4. Jenkins
5. Ansible 
6. PostgreSQL - only if you need to test on local machine

# Usage

1. Spring boot application - for Rest API
    https://github.com/jyothi-kasturi/vf-assignment/tree/master/spring-boot/assignment

2. Terraform (Infrastructure As Code) 
    https://github.com/jyothi-kasturi/vf-assignment/tree/master/terraform

    cd dev
    terraform init
    terraform plan
    terraform apply
 
3. Jenkins Pipelines

    https://github.com/jyothi-kasturi/vf-assignment/tree/master/jenkins 
    1. Jenkinsfile.buildSpringBoot - Build the spring boot applications, with spring profiles
    2. Jenkinsfile.createOrDestroyInfra - This will call terraform scripts to create or destroy infrastructure in AWS
    3. Jenkinsfile deploySpringBoot - Create a Jenkins freestyle job with Jenkins Plugin AWS ElasticBeanstalk.
        Needs enhancement with pipeline code

# Deployment Environment

    1. dev
        Configured spring boot profiles with application-dev.properties
        Terraform modules - cd ../dev
        Jenkins - Select dev as option
    2. test - TODO
    3. prod - TODO

