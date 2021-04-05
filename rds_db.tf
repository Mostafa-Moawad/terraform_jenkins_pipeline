resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "8.0.20"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "admin1234"
  
  skip_final_snapshot  = true
  vpc_security_group_ids   =  [aws_security_group.rdsSequrityGroup.id]
  multi_az             = false
  db_subnet_group_name = module.iti.rds_subnet_group
  
}