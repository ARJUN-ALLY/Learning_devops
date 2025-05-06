resource "aws_vpc" "Star" {
    cidr_block = var.vpc_cidr
    
    tags = {
      Name = "${var.batch_code}"
      createdby = "Pranav"    
    }
  
}
 resource "aws_subnet" "public-Star" {
  cidr_block = var.public_subnet_cidr
  vpc_id = aws_vpc.Star.id
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.batch_code}-public-subnet"
    createdby = "Pranav"
  }
   }
   resource "aws_subnet" "private-Star" {
   count = var.isPrivateSubnetNeeded ? 1 : 0

  cidr_block = var.private_subnet_cidr
  vpc_id = aws_vpc.Star.id
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.batch_code}-private-subnet"
    createdby = "Pranav"
  }
   
 }
resource "aws_route_table" "public-star" {
  vpc_id = aws_vpc.Star.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.star.id
  }
  
}
resource "aws_route_table" "private-star" {
  count = var.isPrivateSubnetNeeded ? 1 : 0
  vpc_id = aws_vpc.Star.id
  
}

resource "aws_route_table_association" "public-star" {
  subnet_id = aws_subnet.public-Star.id
  route_table_id = aws_route_table.public-star.id
}

resource "aws_route_table_association" "private-star" {
  count = var.isPrivateSubnetNeeded ? 1 : 0
  subnet_id = aws_subnet.private-Star[0].id
  route_table_id = aws_route_table.private-star.id
}

resource "aws_internet_gateway" "star" {
  vpc_id = aws_vpc.Star.id
  
}