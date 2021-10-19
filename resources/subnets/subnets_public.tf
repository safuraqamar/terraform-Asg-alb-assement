resource "aws_subnet" "public_subnet_1" {
  vpc_id            = var.vpc_id
  availability_zone = ["us-east-1a", "us-east-1c"]
  cidr_block        = "10.1.0.0/24"
    tags = {
    Name = "${var.name}_Public_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = var.vpc_id
  availability_zone = ["us-east-1a", "us-east-1c"]
  cidr_block        = "10.1.1.0/24"
  
  tags = {
    Name = "${var.name}_Public_2"
  }
}