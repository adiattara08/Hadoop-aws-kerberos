#required Backend et provider
terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  # See /code/03-basics/aws-backend

  backend "s3" {
    bucket         = "devops-directive-tf-state-adiattara"
    key            = "hadoop/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
#define region
# it's can change one day we want to define another region
provider "aws" {
  region = "us-east-1"
}
module "hadoop" {
  source = "./module"
  # Input Variables
}