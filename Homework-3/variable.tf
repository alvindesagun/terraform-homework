# Create variables for the public and private AZs
variable "private_availability_zones" {
  type    = list(string)
  default = ["us-west-2a", "us-west-2b"]
}

variable "public_availability_zones" {
  type    = list(string)
  default = ["us-west-2c", "us-west-2d"]
}

# Create the cidrs for the public and private subnet
variable "private_subnet_cidrs" {
  type = map(string)
  default = {
    us-west-2a = "10.0.1.0/24"
    us-west-2b = "10.0.2.0/24"
  }
}

variable "public_subnet_cidrs" {
  type = map(string)
  default = {
    us-west-2c = "10.0.101.0/24"
    us-west-2d = "10.0.102.0/24"
  }
}

