variable "subnets" {
  type        = string
  }
  variable "name" {
  type        = string
  }
  variable "ami" {
  type        = string
  }
  variable "type" {
  type        = string
  }
  variable "keypair" {
  type        = string
  }
variable "security_groups" {
  
  }
variable "tags" {
  
  }
variable "asg_max_number_of_instances" {
  type        = string
  }
  variable "iam_instance_profile" {
  description = "The IAM role the launched instance will use"
}
variable "asg_minimum_number_of_instances" {
  type        = string
  }
variable "asg_number_of_instances" {
  type        = string
  }
variable "health_check_grace_period" {
  type        = string
  }


variable "vpc_zone_subnets" {

  }
variable "target_groups" {

  }