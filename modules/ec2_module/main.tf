resource "aws_instance" "main" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  tags                        = var.tags
}