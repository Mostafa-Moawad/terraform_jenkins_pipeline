
resource "aws_vpc" "iti" {
  cidr_block = var.cidr


  tags = {
    Name = var.name
    
  }
}

