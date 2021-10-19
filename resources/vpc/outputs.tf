output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(aws_vpc.coal_fire.*.id, [""])[0]
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = concat(aws_vpc.coal_fire.*.arn, [""])[0]
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = concat(aws_vpc.coal_fire.*.cidr_block, [""])[0]
}