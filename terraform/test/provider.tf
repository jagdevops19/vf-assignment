#AWS Provider with London region
#Edit the below file on local machine <username>/.aws/credentials
#[dev]
#aws_access_key_id=
#aws_secret_access_key=

provider "aws" {
  region = "eu-west-2"
  profile = "dev"
}
