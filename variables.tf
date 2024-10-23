variable "aws_region" {
  description = "value for the resource region"
}

# ====================== VPC Variables ======================
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}
variable "cidr_block_route_table" {
  description = "CIDR block for the route table"
}
variable "subnets" {
  description = "block for all the subnets table"
}
# ====================== ec2 Variables ======================
variable "aws_instance" {
  description = "value for the resource instance"
}
variable "key_value" {
  description = "value KeyPair"
}
variable "ami_value" {
  description = "value for the ami"
}
variable "user_data_scripts" {
  description = "List of user data scripts for the instances"
}

# ====================== Loadbalancer Variables ======================
variable "lb_name" {
  description = "Name of the load balancer"
}

variable "target_group_name" {
  description = "Name of the target group"
}

variable "target_group_port" {
  description = "Port for the target group"
}

variable "target_group_protocol" {
  description = "Protocol for the target group"
}

variable "health_check_path" {
  description = "Health check path"
}

variable "health_check_port" {
  description = "Health check port"
}

variable "listener_port" {
  description = "Port for the listener"
}

variable "listener_protocol" {
  description = "Protocol for the listener"
}

# ====================== s3 Variables ======================
variable "s3_bucket_name" {
  description = "List of user data scripts for the instances"
}