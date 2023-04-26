output "tg_id" {
    value = aws_lb_target_group.lb_target_group.id
}

output "url" {
    value = aws_lb.loadbalancer.dns_name
}