resource "aws_elasticache_subnet_group" "iti" {
  name       = "tf-test-cache-subnet"
  subnet_ids = [aws_subnet.private3.id  ,aws_subnet.private4.id]
}