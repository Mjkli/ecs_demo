module "ecs" {
    source = "../modules/ecs"
    ecs_name = var.ecs_name
    ecs_task_name = var.ecs_name + "-task"
    ecs_execution_role = module.ecs_role.id
    container_image = module.flask_app.url
    entrypoint = var.entrypoint
    workingDir = var.workingdir
    port = var.port
    ecs_service_name = var.ecs_name + "-service"
    task_count = var.task_count
    security_group = module.ecs_sg.id
    subnets = [module.public-subnet-1.id]
    lb_target_group = module.ecs_lb.tg_id
  
}

module "ecs_role" {
    source = "../modules/iam/roles"
    role_name = var.ecs_role_name
    role_policy = var.role_policy
    project = var.project
    env = var.env
}

module "ecs_sg" {
    source = "../modules/network/security_groups"
    role_name = "ecs_role"
    assume_role_policy = jsonencode()
    project = var.project
    env = var.env
  
}

module "ecs_lb" {
    source = "../modules/network/loadbalancer"

    lb_name = var.lb_name
    public = "true"
    type = "application"
    security_groups = [module.ecs_sg.id]
    subnets = [module.public-subnet-1.id]
    vpc_id = module.main_vpc.id
}