# use default vpc
data "aws_vpc" "default" {
  default = true
}

# fetch the ami id
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical's AWS account ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

data "aws_ami" "al2" {
  most_recent = true
  owners      = ["137112412989"] # Amazon's AWS account ID

  filter {
    name   = "name"
    values = ["al2023-ami-2023.8.20250707.0-kernel-6.1-x86_64"]
  }
}

# Configure the AWS Provider - commented out for use as module
# provider "aws" {
#   region = var.region
# }

data "aws_vpc" "default_vpc" {
  region  = var.region
  default = true
}

# used to fetch subnet id
data "aws_subnet" "az" {
  vpc_id            = var.instance.vpc_id
  availability_zone = var.ec2_az
}