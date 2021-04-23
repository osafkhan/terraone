provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAQS756WLDXRQF2YTF"
  secret_key = "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"
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAQS756WLDXRQF2YTF"
  secret_key = "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"
   alias="useast1"
}

resource "aws_instance" "us-east2" {
  ami           = "ami-05d72852800cbf29e"
  instance_type = "t2.micro"
  }
  
 resource "aws_instance" "us-east1" {
  ami           = "ami-0742b4e673072066f"
  instance_type = "t2.micro"
  provider=aws.useast1
  } 
  
  resource "aws_s3_bucket" "arcbucket" {
  bucket = "my-tf-first-bucket"
  acl    = "private"

  tags = {
    Name        = "My terra bucket"
    Environment = "Dev-Env"
  }
versioning {
        enabled=true
        }
        }
