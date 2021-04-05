
resource "aws_key_pair" "pub" {
  key_name   = "ec2-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLc7JRDyRXJ2MYNwUuXUuEkUaPQDmu7pO3XgOmkZCkHJ6G73ut+MC0zkg61AnwyW514XIbXib0oZpzR5QdavlHfEmtREk+TRmu8V72RubBSknqzrZS8fhlU7ExVg174cBO8pa1GALFIbeYYzyUqBzNQLA6WTxntUsBxWC5QkjTFVmdnGsvpmWBnX0lkDDh5XZsW5G42l6sWbO5n0YClWAuENo06I8Ai8KddxGzPuGPpS1LXiTquOudq2T+piDBegAo1GFR2YhJV7KSZNOv+81NLgjzEyUDUqaG9Lu0nB5XPe3zrreweyd6XwZlNB08qdWqoQejDAb+SCakLqzkeD9lZkjmXRmrDJuoJHG25jMfpgDsnQqvu2M8ozBgFYEmxEQpPccd+R4Lahce3lmTirXc0Fs6pmyOdYHeBYHVC+PtcpXQnrPKJ0Rn1uO43KIFHjEdKhtyZ3IA5LjLgf9oyufBLkG2zV35bWL8Ny6K4chc74ECBWxHHJSXzPr8ovtLxTE= mostafa@mostafa"
}



resource "aws_instance" "bastian" {
  ami                    = var.ec2_ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.itiSsh.id]
  subnet_id              = module.iti.public1_id
  key_name               = aws_key_pair.pub.key_name
  tags = {
    Name = "bastian"
  }

  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip}"
  }
}


resource "aws_instance" "privateServerInstance" {
  ami                    = var.ec2_ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.itiSshPrivate.id]
  subnet_id              = module.iti.private1_id
  key_name               = aws_key_pair.pub.key_name
  tags = {
    Name = "privateServerInstance"
  }
}

