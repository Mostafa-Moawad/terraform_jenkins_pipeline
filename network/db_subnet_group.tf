resource "aws_db_subnet_group" "rds_sub_group" {
  name        = "rds-subnet-group"
  description = "Terraform example RDS subnet group"
  subnet_ids  = [aws_subnet.private3.id  ,aws_subnet.private4.id]
}
