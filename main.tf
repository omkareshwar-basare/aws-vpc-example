resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

    tags = local.vpc_final_tags
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id              #VPC association

  tags = local.igw_tags
}   

#public subnets

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = true
  tags = merge(
    {
      Name = "${local.project}-${local.environment}-public-subnet-${local.az_names[count.index]}"
    },
    var.public_subnet_tags
  )
}
