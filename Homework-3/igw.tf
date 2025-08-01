# Create IGW for public subnet
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "homework23_igw"
  }
}

# Create NAT Gateway for private subnets

resource "aws_eip" "nat_gw" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw" {
  depends_on    = [aws_internet_gateway.gw]
  allocation_id = aws_eip.nat_gw.id
  subnet_id     = [for s in aws_subnet.public_subnet : s.id][1]

  tags = {
    Name = "homewor23_ NATgw"
  }
}