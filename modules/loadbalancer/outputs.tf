output "my-noob-terraws-alb-dns-name" {
  value = aws_lb.my_noob_terraws_alb.dns_name
  description = "The public DNS of the EC2 instance"
}