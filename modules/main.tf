module "s3_bucket_for_logs" {
  source = "../resources/s3"
  name   = "${var.name}-s3-1-${var.env}"
  
}

module "coalfire_vpc" {
  source       = "../resources/vpc"
  name         = "${var.name}-vpc-${var.env}"
  cidr         = "10.1.0.0/16"
  pub_subnet_1 = module.subnets_coalfire.pub_sub_1
  pub_subnet_2 = module.subnets_coalfire.pub_sub_2
  tags = var.tags
}

module "subnets_coalfire" {
  source = "../resources/subnets"
  vpc_id = module.coalfire_vpc.vpc_id
  name   = "${var.name}-subnet-${var.env}"

}
module "security_groups" {
  source  = "../resources/sg"
  vpc_id  = module.coalfire_vpc.vpc_id
  subnets = module.subnets_coalfire.private_2_id
  name = "${var.name}-sg-${var.env}"

}
module "ec2_instance" {
  source          = "../resources/ec2"
  subnets         = module.subnets_coalfire.pub_sub_1
  security_groups = [module.security_groups.securitygroup_Pub_sub_2]
  ami             = var.ami
  type            = var.instanceType
  keypair         = var.keypair
  tags = var.tags
}
module "asg" {
  source          = "../resources/asg"
  name = "${var.name}-asg-${var.env}"
  subnets         = module.subnets_coalfire.private_2_id
  security_groups = [module.security_groups.securitygroup_Pvt_sub_2]
  ami             = var.ami
  type            = var.instanceType
  keypair         = var.keypair
  iam_instance_profile = ""
  asg_number_of_instances = "2"
  asg_minimum_number_of_instances ="2"
  asg_max_number_of_instances = "6"
  health_check_grace_period = "300"
  vpc_zone_subnets = [module.subnets_coalfire.pub_sub_2]
  target_groups = [module.application_loadbalancer.target_groups_arn]
  tags = var.tags
}
module "application_loadbalancer" {
  source  = "../resources/alb"
  name = "${var.name}-alb-${var.env}"
  subnets = [module.subnets_coalfire.private_1_id, module.subnets_coalfire.private_2_id ]
  vpc_id  = module.coalfire_vpc.vpc_id
  security_group = [module.security_groups.securitygroup_Pvt_sub_2]
  tags = var.tags
}