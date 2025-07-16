# create EC2 ubuntu instance in us-west-2 
resource "aws_instance" "ubuntu" {
  depends_on             = [aws_key_pair.bastion_key]
  subnet_id              = [for s in aws_subnet.public_subnet : s.id][0]
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.bastion_key.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data              = file("apache.sh")
  tags = {
    Name = "Ubuntu"
  }
}

# create EC2 al2 instance in us-west-2 
resource "aws_instance" "al2" {
  depends_on             = [aws_key_pair.bastion_key]
  subnet_id              = [for s in aws_subnet.public_subnet : s.id][1]
  ami                    = data.aws_ami.al2.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.bastion_key.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data              = file("httpd.sh")
  tags = {
    Name = "Amazon"
  }
}

#create an output to display the public IP of the EC2 instance
output "ubuntu_public_ip" {
  value = aws_instance.ubuntu.public_ip
}

output "al2_public_ip" {
  value = aws_instance.al2.public_ip
}