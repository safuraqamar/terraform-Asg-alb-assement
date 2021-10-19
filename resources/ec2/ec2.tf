resource "aws_instance" "sub2_instance" {

  ami           = var.ami #"ami-0533f2ba8a1995cf9"
  instance_type = var.type #"t2.micro"
  key_name      = var.keypair #"MyKeyPair"
  subnet_id                   = var.subnets
  vpc_security_group_ids      = var.security_groups
  associate_public_ip_address = true
  availability_zone = "us-east-1c"
  tags = var.tags
}
resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = "us-east-1c"
  size              = 20

  tags = var.tags
}


resource "aws_volume_attachment" "ebs_sub2" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.sub2_instance.id
}