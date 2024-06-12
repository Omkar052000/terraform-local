terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.52.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

locals {
        instance = {"Omkar":"ami-00fa32593b478ad6e","Ramesh":"ami-0f58b397bc5c1f2e8"}
}

resource "aws_instance" "my_ec2_instance" {
        for_each = local.instance
        ami = each.value
        instance_type = "t2.micro"
        tags = {
                Name = each.key
}
}
