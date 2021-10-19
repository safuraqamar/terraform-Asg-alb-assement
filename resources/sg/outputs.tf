output "securitygroup_Pub_sub_1" {
  description = "security group"
  value       = aws_security_group.sg_Pub_sub1.id
}
output "securitygroup_Pub_sub_2" {
  description = "security group"
  value       = aws_security_group.sg_Pub_sub2.id
}
output "securitygroup_Pvt_sub_1" {
  description = "security group"
  value       = aws_security_group.sg_Pvt_sub1.id
}
output "securitygroup_Pvt_sub_2" {
  description = "security group"
  value       = aws_security_group.sg_Pvt_sub1.id
}