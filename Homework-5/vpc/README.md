# terraform.tfvars file

Specifies values for variables in variables.tf file

```hcl
# specs for region
region = "us-west-2"

# specs for vpc values
vpc = {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

# specs for ports for SG
sg = {
  port        = [22, 80, 443, 3306] # SSH, HTTP, HTTPS, MySQL
  name        = "homework-4-sg"
  description = "homework 4 security group"
}

# specs for private AZ
pri_availability_zones = {
  availability_zone       = ["us-west-2a", "us-west-2b"]
  map_public_ip_on_launch = false
}

# specs for private  subnet
pri_subnet_cidrs = {
  us-west-2a = "10.0.1.0/24"
  us-west-2b = "10.0.2.0/24"
}

# specs for public AZ
pub_availability_zones = {
  availability_zone       = ["us-west-2c", "us-west-2d"]
  map_public_ip_on_launch = true
}

# specs for public subnet
pub_subnet_cidrs = {
  us-west-2c = "10.0.101.0/24"
  us-west-2d = "10.0.102.0/24"
}

# specs for environment
environment = "Prod"