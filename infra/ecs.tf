module "ecs" {
    source = "../modules/ecs"
    ecs_name = var.ecs_name
    ecs_task_name = var.ecs_name + "-task"
    ecs_execution_role = 
    container_image = var.image
    entrypoint = var.entrypoint
    workingDir = var.workingdir
    port = var.port
    ecs_service_name = var.ecs_name + "-service"
    task_count = ""
    security_group = 
    subnets = [module.public-subnet-1.id]
    lb_target_group = 
  
}

module "ecs_role" {
    source = "../modules/iam/roles"
    role_name = var.ecs_role_name
    role_policy = var.role_policy
    project = var.project
    env = var.env
}