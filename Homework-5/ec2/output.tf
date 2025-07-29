# outputs
output "ec2_subnet" {
  value = data.aws_subnet.az.id
}

output "ec2_az" {
  value = var.ec2_az
}

output "region" {
  value = var.region
}

output "vpc_id" {
  value = data.aws_vpc.default_vpc.id
}