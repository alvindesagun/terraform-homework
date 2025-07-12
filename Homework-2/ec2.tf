# create EC2 instance in us-east-1 
resource "aws_instance" "web" {
  depends_on             = [aws_key_pair.bastion_key]
  count                  = 3
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = [for s in data.aws_subnet.public : s.id][count.index]
  key_name               = aws_key_pair.bastion_key.key_name
  vpc_security_group_ids = [aws_security_group.allow-hw2-sg.id]
  user_data              = file("apache.sh")
  tags = {
  Name = "web-${count.index + 1}" }
}

# create an output to display the public IP of the EC2 instance
output "public_ip" {
  value = ["${aws_instance.web.*.public_ip}"]
}