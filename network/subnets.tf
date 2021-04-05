resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.iti.id
  cidr_block              = var.public1_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.az1
  tags = {
    Name = var.name
    type = "public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.iti.id
  cidr_block              = var.public2_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.az2

  tags = {
    Name = var.name
    type = "public2"
  }
}


resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.iti.id
  cidr_block = var.private1_subnet_cidr
    map_public_ip_on_launch = true

  availability_zone = var.az1
  tags = {
    Name = var.name
    type = "private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.iti.id
  cidr_block = var.private2_subnet_cidr
  map_public_ip_on_launch = true

  availability_zone = var.az2


  tags = {
    Name = var.name
    type = "private2"
  }
}




resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.iti.id
  cidr_block = var.private3_subnet_cidr

  availability_zone = var.az1
  tags = {
    Name = var.name
    type = "private3"
  }
}

resource "aws_subnet" "private4" {
  vpc_id     = aws_vpc.iti.id
  cidr_block = var.private4_subnet_cidr

  availability_zone = var.az2


  tags = {
    Name = var.name
    type = "private4"
  }
}




# resource "aws_subnet" "private1" {
#   vpc_id     = aws_vpc.iti.id
#   cidr_block = "10.0.3.0/24"

#       availability_zone = "us-east-2a"

#   tags = {
#     Name = "private1"
#   }
# }

# resource "aws_subnet" "private2" {
#   vpc_id     = aws_vpc.iti.id
#   cidr_block = "10.0.4.0/24"
#     availability_zone = "us-east-2b"

#   tags = {
#     Name = "private2"
#   }
# }