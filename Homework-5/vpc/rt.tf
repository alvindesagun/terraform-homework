# create a public route table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = merge(
    { "Name" = "public-rt" },
    { "Environment" = "${var.environment}" },
    local.common_tags
  )
}

# iterate to each public subnet and associate default route
resource "aws_route_table_association" "public_subnets" {
  for_each       = aws_subnet.public_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public-rt.id
}

# create private route table
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = merge(
    { "Name" = "private-rt" },
    { "Environment" = "${var.environment}" },
    local.common_tags
  )
}

# iterate to each public subnet and associate default route
resource "aws_route_table_association" "private_subnets" {
  for_each       = aws_subnet.private_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private-rt.id
}

