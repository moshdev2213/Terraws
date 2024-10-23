variable "lb_name" {
  description = "Name of the load balancer"
}

variable "security_group_id" {
  description = "Security group for the load balancer"
}

variable "subnets" {
  description = "Subnets for the load balancer"
}

variable "vpc_id" {
  description = "VPC ID for the load balancer"
}
variable "ec2_instance_ids" {
  description = "List of EC2 instance IDs to attach to the target group"
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
  description = "Health check path for the target group"
}

variable "health_check_port" {
  description = "Health check port for the target group"
}

variable "listener_port" {
  description = "Port for the load balancer listener"
}

variable "listener_protocol" {
  description = "Protocol for the load balancer listener"
}
