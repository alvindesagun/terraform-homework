# create locals variable to map subnet IDs to their names
locals {
  subnet_map = [
    "subnet-065fb81fa5a2497d5", # us-east-1a
    "subnet-0825cd418c5ebfb7e", # useast-1b
    "subnet-09a201f87945234b0" # us-east-1c
  ]
}

# create EC2 instance in us-east-1 
resource "aws_instance" "web" {
  depends_on             = [aws_key_pair.bastion_key]
  count                  = 3
  ami                    = "ami-020cba7c55df1f615"
  instance_type          = "t2.micro"
  subnet_id              = local.subnet_map[count.index]
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