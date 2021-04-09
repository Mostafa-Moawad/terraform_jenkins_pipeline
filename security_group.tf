


resource "aws_security_group" "itiSsh" {
  name        = "allow ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = module.iti.vpc_id

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}





resource "aws_security_group" "itiSshPrivate" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = module.iti.vpc_id

  ingress {

    description = "Internal SSH Port"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }


  ingress {

    description = "Nginx"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg2"
  }
}







resource "aws_security_group" "rdsSequrityGroup" {
  name        = "rds security group"
  description = "Allow rds inbound traffic"
  vpc_id      = module.iti.vpc_id

  ingress {
    description = "rds"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_rds"
  }
}


resource "aws_security_group" "redis" {
  name        = "redis connection"
  description = "Allow redis inbound traffic"
  vpc_id      = module.iti.vpc_id

 

  ingress {
    description = "http"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [var.cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_port_6379"
  }
}