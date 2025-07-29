# create private subnets on each AZ - loop
resource "aws_subnet" "private_subnet" {
  for_each                = toset(var.pri_availability_zones.availability_zone)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pri_subnet_cidrs[each.key]
  availability_zone       = each.key
  map_public_ip_on_launch = var.pri_availability_zones.map_public_ip_on_launch
  tags = merge(
    { "Name" = "pri-subnet-${each.key}" },
    { "Environment" = "${var.environment}" },
    local.common_tags
  )
}

# Create public subnet on each AZ - loop
resource "aws_subnet" "public_subnet" {
  for_each                = toset(var.pub_availability_zones.availability_zone)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub_subnet_cidrs[each.key]
  availability_zone       = each.key
  map_public_ip_on_launch = var.pub_availability_zones.map_public_ip_on_launch
  tags = merge(
    { "Name" = "pub-subnet-${each.key}" },
    { "Environment" = "${var.environment}" },
    local.common_tags
  )
}