# Software overview
On Windows, install below software

1. Java 1.8.0_241 (Spring-boot-2.2.5)
2. Maven - 3.6.2
3. Terraform_0.12.21_windows_amd64
4. Jenkins 
5. Ansible - use to configure any software installations
6. PostgreSQL - only if you need to test on local machine
7. AWS CLI - to configure the credentials
8. AWS - Elasticbeanstalk

# Usage [* Only dev environment will work end to end, please select dev from jenkins jobs]


1. How to run it with Jenkins Pipelines ?

    Please access https://github.com/jyothi-kasturi/vf-assignment/documentation/How_to_run_Jenkins_pipeline_jobs.pdf

    and setup the jenkins jobs as described in that documentation. 

    https://github.com/jyothi-kasturi/vf-assignment/jenkins 

    1. Jenkinsfile.buildSpringBoot - Build the spring boot applications, with spring profiles
    2. Jenkinsfile.createOrDestroyInfra - This will call terraform scripts to create or destroy infrastructure in AWS
    3. Jenkinsfile deploySpringBoot - Create a Jenkins freestyle job with Jenkins Plugin AWS ElasticBeanstalk.

2. Terraform (Infrastructure As Code) 

    https://github.com/jyothi-kasturi/vf-assignment/terraform

    cd dev

    terraform init
    
    terraform plan

    terraform apply        
    
3. Spring boot application Rest API

    https://github.com/jyothi-kasturi/vf-assignment/spring-boot/assignment

    On Local machine, build with

    mvn clean install -Pdev -DskipTests=true

    GET - http://localhost:5000/timeStamps

    GET - http://localhost:5000/timeStamps/1

    POST - http://localhost:5000/timeStamps

    DELETE - http://localhost:5000/timeStamps/1

4. AWS 

    1. Edit the below file on local machine username/.aws/credentials

    [dev]

    aws_access_key_id=

    aws_secret_access_key=

    2. Make sure vf.keypair.pem and vf.keypair.pub exists at C://assignment


# AWS Costs

    Use free tier where possible
    Here, NAT gateways incur costs so please destory the infrastructure once done or comment that code in vpc.tf

# Configure Deployment Environments 

    1. dev
        Configure spring boot profiles with ../resources/application-dev.properties
        Terraform modules - cd ../terraform/dev 
        Jenkins - Select dev as environment option
    2. test 
        Configure spring boot profiles with ../resources/application-test.properties
        Terraform modules - cd ../terraform/test
        Jenkins - Select test as environment option
    3. prod 
        Configure spring boot profiles with ../resources/application-prod.properties
        Terraform modules - cd ../terraform/prod
        Jenkins - Select prod as environment option

