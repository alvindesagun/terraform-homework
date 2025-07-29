# terraform.tfvars file

Specifies values for variables in variables.tf file

```hcl
# specs for region
region = "us-west-2"

# specs for key name
key_name = "homework-5-key"

# specs for EC2
instance = {
  hostname               = "ubuntu"                # specify the server hostname
  instance_type          = "t3"                    # use t3 for ubuntu and t2 for amazon ami 
  ami                    = "ubuntu"                # use ubuntu for ubuntu and al2 for amazon ami
  vpc_security_group_ids = "sg-0bc1490d0b2a9dd5d"  # specs for SG
  vpc_id                 = "vpc-087f1f3c40fd1c6a9" # specs for VPC
  user_data              = null
}

# specs for environment
environment = "Prod"

# specs for AZ
ec2_az = "us-west-2c"