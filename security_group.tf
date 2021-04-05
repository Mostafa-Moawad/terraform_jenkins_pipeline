


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
    cidr_blocks = [var.cidr]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }


  ingress {

    description = "Nginx"
    cidr_blocks = [var.cidr]
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