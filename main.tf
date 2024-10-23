# ===================== vpc Module ========================
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block         = var.vpc_cidr_block
  subnets                = var.subnets
  cidr_block_route_table = var.cidr_block_route_table
}
locals {
  subnet_ids = flatten(module.vpc.subnet_ids)
}

# ===================== ec2 Module ========================
module "ec2_instance" {
  source = "./modules/ec2"

  instance_count    = length(local.subnet_ids)
  ami_value         = var.ami_value
  aws_instance      = var.aws_instance
  subnet_id         = local.subnet_ids
  key_value         = var.key_value
  security_group_id = [module.vpc.security_group_id]
  user_data_script  = var.user_data_scripts
}

# ===================== Load Balancer Module ========================
module "loadbalancer" {
  source = "./modules/loadbalancer"

  lb_name               = var.lb_name
  security_group_id     = [module.vpc.security_group_id]
  subnets               = local.subnet_ids
  target_group_name     = var.target_group_name
  target_group_port     = var.target_group_port
  target_group_protocol = var.target_group_protocol
  vpc_id                = module.vpc.vpc_id
  health_check_path     = var.health_check_path
  health_check_port     = var.health_check_port
  ec2_instance_ids      = module.ec2_instance.instance_ids
  listener_port         = var.listener_port
  listener_protocol     = var.listener_protocol
}

# ===================== s3 Module ========================
module "s3" {
  source = "./modules/s3"

  bucket_name = var.s3_bucket_name
}


