# create private subnets on each AZ - loop
resource "aws_subnet" "private_subnet" {
  for_each          = toset(var.private_availability_zones)
  vpc_id            = aws_vpc.kaizen.id
  cidr_block        = var.private_subnet_cidrs[each.key]
  availability_zone = each.key
  tags = {
    Name = "pri-subnet-${each.key}"
  }
}

# Create public subnet on each AZ - loop
resource "aws_subnet" "public_subnet" {
  for_each                = toset(var.public_availability_zones)
  vpc_id                  = aws_vpc.kaizen.id
  cidr_block              = var.public_subnet_cidrs[each.key]
  availability_zone       = each.key
  map_public_ip_on_launch = true
  tags = {
    Name = "pub-subnet-${each.key}"
  }
}