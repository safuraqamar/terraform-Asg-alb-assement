output "pub_sub_1" {
  description = "Public subnet 1"
  value       = aws_subnet.public_subnet_1.id
}
output "pub_sub_2" {
  description = "public subnet 2"
  value       = aws_subnet.public_subnet_2.id
}
output "private_1_id" {
  description = "Private subnet 1"
  value       = aws_subnet.private_subnet_1.id
}

output "private_2_id" {
  description = "Private subnet 2"
  value       = aws_subnet.private_subnet_2.id
}