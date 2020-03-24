# Assignment
On Windows, install below software

1. Java 1.8.0_241 (Spring-boot-2.2.5)
2. Maven - 3.6.2
3. Terraform_0.12.21_windows_amd64
4. Jenkins
5. Ansible 
6. PostgreSQL - only if you need to test on local machine
7. AWS - Elasticbeanstalk

# Usage

1. Spring boot application Rest API

    https://github.com/jyothi-kasturi/vf-assignment/tree/master/spring-boot/assignment

    On Localmachine

    GET - http://<ip>:5000/timeStamps
    GET - http://<ip>:5000/timeStamps{1}
    POST - http://<ip>:5000/timeStamps
    DELETE - http://<ip>:5000/timeStamps{1}

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
        TODO - Deploy pipeline code

# Configure Deployment Environments 

    1. dev
        Configured spring boot profiles with ../resources/application-dev.properties
        Terraform modules - cd ../terraform/dev 
        Jenkins - Select dev as environment option
    2. test 
        Configured spring boot profiles with ../resources/application-test.properties
        Terraform modules - cd ../terraform/test
        Jenkins - Select test as environment option
    3. prod 
        Configured spring boot profiles with ../resources/application-prod.properties
        Terraform modules - cd ../terraform/prod
        Jenkins - Select prod as environment option

