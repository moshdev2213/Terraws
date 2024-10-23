output "my-noob-terraws-alb-dns-name" {
  value = module.loadbalancer.my-noob-terraws-alb-dns-name
  description = "The public DNS of the EC2 instance"
}