resource "aws_subnet" "private_subnet_1" {
  vpc_id            = var.vpc_id
  availability_zone = ["us-east-1a", "us-east-1c"]
  cidr_block        = "10.1.2.0/24"
    tags = {
    Name = "${var.name}_Private_1"
  }
}
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = var.vpc_id
  availability_zone = ["us-east-1a", "us-east-1c"]
  cidr_block        = "10.1.3.0/24"
   tags = {
    Name = "${var.name}_Private_2"
  }
}