module "ecs" {
    source = "../modules/ecs"
    ecs_name = var.ecs_name
    ecs_task_name = "${var.ecs_name}-task"
    ecs_execution_role = module.ecs_role.arn
    container_image = module.flask_app.url
    entrypoint = var.entrypoint
    workingDir = var.workingdir
    port = var.port
    ecs_service_name = "${var.ecs_name}-service"
    task_count = var.task_count
    security_group = module.ecs_sg.id
    subnets = [module.public-subnet-1.id,module.public-subnet-2.id]
    lb_target_group = module.ecs_lb.tg_id
  
}


module "ecs_sg" {
    source = "../modules/network/security_groups"

    vpc_id = module.main_vpc.id
    ingress = var.ecs_ingress
    egress = var.ecs_egress
    project = var.project
    env = var.env
  
}

module "ecs_lb" {
    source = "../modules/network/loadbalancer"

    lb_name = var.lb_name
    internal = false
    type = "application"
    port = var.port
    protocol = var.protocol
    security_groups = [module.ecs_sg.id]
    subnets = [module.public-subnet-1.id,module.public-subnet-2.id]
    vpc_id = module.main_vpc.id
}
