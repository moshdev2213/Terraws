# =============== create the vpc ======================
resource "aws_vpc" "my_noob_terraws_vpc" {
  cidr_block = var.vpc_cidr_block
}

# =============== create subnets for the vpc ======================
resource "aws_subnet" "my_noob_terraws_subnets" {
  count                   = length(var.subnets)
  vpc_id                  = aws_vpc.my_noob_terraws_vpc.id
  cidr_block              = var.subnets[count.index].cidr_block
  availability_zone       = var.subnets[count.index].availability_zone
  map_public_ip_on_launch = true
}

# =============== create internet gateway ======================
resource "aws_internet_gateway" "my_noob_terraws_igw" {
    vpc_id = aws_vpc.my_noob_terraws_vpc.id
}

# ====================== create route table ======================
# link Internet gateway to the route table
resource "aws_route_table" "my_noob_terraws_rt" {
    vpc_id = aws_vpc.my_noob_terraws_vpc.id

    route {
        cidr_block = var.cidr_block_route_table
        gateway_id = aws_internet_gateway.my_noob_terraws_igw.id
    }
}
resource "aws_route_table_association" "my_noob_terraws_rta" {
  count         = length(var.subnets)
  subnet_id     = aws_subnet.my_noob_terraws_subnets[count.index].id
  route_table_id = aws_route_table.my_noob_terraws_rt.id
}

# Security Group
resource "aws_security_group" "my_noob_terraws_sg" {
  vpc_id = aws_vpc.my_noob_terraws_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
