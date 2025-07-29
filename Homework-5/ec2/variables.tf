# variable for region
variable "region" {
  type        = string
  description = "Provide Region in tfvars"
}

# var for key pair name
variable "key_name" {
  type        = string
  description = "Provide key name in tfvars"
}

# variables for environment
variable "environment" {
  type        = string
  description = "Provide Environment in tfvars"
}

# variables for EC2
variable "instance" {
  type = object({
    hostname               = string
    user_data              = string
    ami                    = string
    vpc_security_group_ids = string
    vpc_id                 = string
    instance_type          = string
    }
  )
  description = "Provide EC2 details in tfvars"
}

# variable for EC2 availability zone
variable "ec2_az" {
  type        = string
  description = "Provide AZ details in tfvars"
}