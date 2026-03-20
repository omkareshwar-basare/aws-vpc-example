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
      Name = "${var.project}-${var.environment}-public-subnet-${local.az_names[count.index]}"
    },
    var.public_subnet_tags
  )
}


#private subnets

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge(
    {
      Name = "${var.project}-${var.environment}-private-subnet-${local.az_names[count.index]}"
    },
    var.private_subnet_tags
  )
}


#database subnets

resource "aws_subnet" "database" {
  count = length(var.database_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidrs[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge(
    {
      Name = "${var.project}-${var.environment}-database-subnet-${local.az_names[count.index]}"
    },
    var.database_subnet_tags
  )
}

#public route table

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id           #vpc association

  tags = merge(
    {
      Name = "${var.project}-${var.environment}-public}-route-table"
    },
    var.public_route_table_tags
  )
}

#private route table

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id           #vpc association

  tags = merge(
    {
      Name = "${var.project}-${var.environment}-private}-route-table"
    },
    var.private_route_table_tags
  )
}

#database route table

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id           #vpc association

  tags = merge(
    {
      Name = "${var.project}-${var.environment}-database}-route-table"
    },
    var.database_route_table_tags
  )
}
