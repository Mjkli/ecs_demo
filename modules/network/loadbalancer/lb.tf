resource "aws_lb" "loadbalancer" {
    name = var.lb_name
    internal = var.public
    load_balancer_type = var.type
    security_groups = var.security_groups
    subnets = var.subnets

}

resource "aws_lb_target_group" "lb_target_group" {
    name = "${aws_lb.loadbalancer.name}-tg"
    port = var.port
    target_type = "ip"
    protocol = var.protocol
    vpc_id = var.vpc_id
}

resource "aws_lb_listener" "listener" {
    load_balancer_arn = aws_lb.loadbalancer.arn
    port = var.port
    protocol = var.protocol
    
    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.lb_target_group.arn
    }
  
}