#creating s3 bucket 

provider "aws" {
    region = "us-east-1"
  
}
resource "aws_s3_bucket" "my-s3name" {
    bucket = "syedezhil" #unique
    acl = "private"

    tags = {
      Name = "pavitha"
      Environment = "prod"
    }
}


#pushing statefile in s3 bucket

provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "syedezhil"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

#exporting tf output in a file

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "testing" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
  tags = {
    Name = "testing"
    region = "uw1"
    environment = "prod"
    managed_by = "terraform"
  }
}

output "vpc_output" {
    value = aws_vpc.testing
}

----------------------------------------
#terminal
~terrerform init
~terrerform apply -auto-approve
~terrerform output -json > ./output_vpc.txt(json)





