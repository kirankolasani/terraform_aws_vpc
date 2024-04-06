resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
    var.common_tags,
    var.vpc_tags
  )
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.igw_tags
  )
  
}
resource "aws_subnet" "public" {
  count = length(var.public_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidr[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(
    var.common_tags,
    { Name = var.public_subnet_names[count.index] }
  )
}

resource "aws_subnet" "private" {
  count = length(var.private_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_cidr[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(
    var.common_tags,
    { Name = var.private_subnet_names[count.index] }
  )
}

resource "aws_subnet" "database" {
  count = length(var.database_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_cidr[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(
    var.common_tags,
    { Name = var.database_subnet_names[count.index] }
  )
}

resource "aws_route" "public" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = var.igw_r_cidr
  gateway_id = aws_internet_gateway.main.id
  depends_on = [ aws_route_table.public ]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.public_rt_tags
  )
}
# associate public route table with public subnets
# public-route-table --> public-1a subnet
# public-route-table --> public-1b subnet
resource "aws_route_table_association" "public" {
  count = length(var.public_cidr)
  subnet_id      = aws_subnet.public[count.index].id
  # subnet_id      = element(aws_subnet.public[*].id, count.index) # This element function also will work.
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.private_rt_tags
  )
}

resource "aws_route_table_association" "private" {
  count = length(var.private_cidr)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.database_rt_tags
  )
}

resource "aws_route_table_association" "database" {
  count = length(var.database_cidr)
  subnet_id      = aws_subnet.database[count.index].id
  route_table_id = aws_route_table.database.id
}

