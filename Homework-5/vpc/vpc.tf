# creeate a VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc.cidr_block
  enable_dns_support   = var.vpc.enable_dns_support
  enable_dns_hostnames = var.vpc.enable_dns_hostnames
  tags = merge(
    { "Name" = "${var.environment}-VPC" },
    { "Environment" = "${var.environment}" },
    local.common_tags
  )
}