# Variables
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}
variable "cidr_block_route_table" {
  description = "CIDR block for the route table"
}
variable "subnets" {
  description = "block for all the subnets table"
}