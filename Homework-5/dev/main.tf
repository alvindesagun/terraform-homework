
# Use a variable to set region for both modules
variable "region" {
  type    = string
  default = "us-east-2"
}

# Call VPC Module and provide values

module "vpc" {
  # specs for source  
  source = "../vpc"

  # specs for region
  region = var.region

  # specs for vpc values
  vpc = {
    cidr_block           = "10.0.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true
  }

  # specs for ports for SG
  sg = {
    port        = [22, 80] # SSH, HTTP
    name        = "homework-5-sg"
    description = "homework 5 security group"
  }

  # specs for private AZ
  pri_availability_zones = {
    availability_zone       = ["us-east-2c"]
    map_public_ip_on_launch = false
  }

  # specs for private  subnet
  pri_subnet_cidrs = {
    us-east-2c = "10.0.1.0/24"
  }

  # specs for public AZ
  pub_availability_zones = {
    availability_zone       = ["us-east-2a", "us-east-2b"]
    map_public_ip_on_launch = true
  }

  # specs for public subnet
  pub_subnet_cidrs = {
    us-east-2a = "10.0.101.0/24"
    us-east-2b = "10.0.102.0/24"
  }

  # specs for environment
  environment = "Dev"
}

# Create AZ variable to loop through 3 different AZs
locals { az = ["us-east-2a", "us-east-2b", "us-east-2c"] }

# loop EC2 Module and provide values through the modules to create

module "ec2" {
  # iterate through each AZ
  for_each = toset(local.az)
  ec2_az   = each.key

  # specs for source
  source = "../ec2"

  # specs for region
  region = var.region

  # specs for key name
  key_name = "homework-5-key-${each.key}"

  # specs for environment
  environment = "Dev"

  # loop through eash az and create EC2 on each
  instance = {
    hostname               = "server-${each.key}" # specify the server hostname
    instance_type          = "t2"                 # use t3 for ubuntu and t2 for amazon ami 
    ami                    = "al2"                # use ubuntu for ubuntu and al2 for amazon ami
    vpc_security_group_ids = module.vpc.sg_id     # fetch from SG id from VPC module
    vpc_id                 = module.vpc.vpc_id    # fetch from VPC module
    user_data              = null

  }
}