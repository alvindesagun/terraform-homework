# variable for region
variable "region" {
  type        = string
  description = "Provide Region in tfvars"
}

# variable for VPC
variable "vpc" {
  type = object({
    cidr_block           = string
    enable_dns_support   = bool
    enable_dns_hostnames = bool
  })
  description = "provide values in tfvars"
}

# variables for SG
variable "sg" {
  type = object({
    port        = list(number)
    name        = string
    description = string
  })
  description = "Provide name and ports to open in tfvars"
}

# variables for private AZ 
variable "pri_availability_zones" {
  type = object({
    availability_zone       = list(string)
    map_public_ip_on_launch = bool
  })
  description = "Provide private AZ in tfvars"
}

# variables for private subnet cidrs
variable "pri_subnet_cidrs" {
  type        = map(string)
  description = "Provide subnet cidr AZ map in tfvars"
}

# variables for public AZ 
variable "pub_availability_zones" {
  type = object({
    availability_zone       = list(string)
    map_public_ip_on_launch = bool
  })
  description = "Provide public AZ in tfvars"
}

# variables for public subnet cidrs
variable "pub_subnet_cidrs" {
  type        = map(string)
  description = "Provide subnet cidr AZ map in tfvars"
}

# variables for environment
variable "environment" {
  type        = string
  description = "Provide Environment in tfvars"
}

