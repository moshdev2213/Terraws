# Output for security group ID
output "security_group_id" {
  value = aws_security_group.my_noob_terraws_sg.id
}
# Output for security vpc ID
output "vpc_id" {
  value = aws_vpc.my_noob_terraws_vpc.id
}
# Output multiple subnet ids
output "subnet_ids" {
  value = aws_subnet.my_noob_terraws_subnets[*].id
}