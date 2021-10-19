provider "aws" {
  region     = local.region
}

locals {
  region = "us-east-1"
}
module "dev-stack" {
  source = "../../modules"
  tags = {
    Owner       = "user"
    Environment = "dev"
  }
  name         = "coalfire-saf"
  env          = "dev"
  keypair      = "coalfire-assement-key"
  ami          = "ami-09e67e426f25ce0d7"
  instanceType = "t2.micro"
}