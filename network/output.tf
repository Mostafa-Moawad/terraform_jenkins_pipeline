output "public1_id"{
    value=aws_subnet.public1.id
} 

output "public2_id"{
    value=aws_subnet.public2.id
}

output "private1_id"{
    value=aws_subnet.private1.id
} 

output "private2_id"{
    value=aws_subnet.private2.id
}



output "private3_id"{
    value=aws_subnet.private3.id
} 

output "private4_id"{
    value=aws_subnet.private4.id
}





output "vpc_id" {
    value = aws_vpc.iti.id
  
}



output "rds_subnet_group" {
  value = aws_db_subnet_group.rds_sub_group.id
}




output "redis_subnet_group" {
  value = aws_elasticache_subnet_group.iti.id
}