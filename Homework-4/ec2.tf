# create EC2 
resource "aws_instance" "instance" {
  depends_on             = [aws_key_pair.bastion_key]
  count                  = var.instance.count
  subnet_id              = data.aws_subnet.az.id
  instance_type          = var.instance.instance_type == "t3" ? "t3.micro" : "t2.micro"
  ami                    = var.instance.ami == "ubuntu" ? data.aws_ami.ubuntu.id : data.aws_ami.al2.id
  key_name               = aws_key_pair.bastion_key.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data              = var.instance.user_data
  tags = merge(
    { "Name" = "${var.instance.hostname}-${count.index + 1}" },
    local.merge_name
  )
}
