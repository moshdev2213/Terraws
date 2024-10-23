resource "aws_instance" "ec2_instance" {
  count                  = var.instance_count
  ami                    = var.ami_value
  instance_type          = var.aws_instance
  subnet_id              = var.subnet_id[count.index]
  key_name               = var.key_value
  vpc_security_group_ids = [var.security_group_id[0]]
  user_data              = base64encode(file(var.user_data_script[count.index]))
}
