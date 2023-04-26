resource "aws_ecs_cluster" "ecs_cluster" {
    name = var.ecs_name

    setting {
      name = "containerInsights"
      value = "enabled"
    }
  
}

resource "aws_ecs_task_definition" "task" {
  family = var.ecs_task_name
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu = 256
  memory = 512
  execution_role_arn = var.ecs_execution_role
  task_role_arn = var.ecs_execution_role
  container_definitions = jsonencode([
    {
      name = var.ecs_task_name
      image = var.container_image
      essential = true
      entrypoint = var.entrypoint
      workingDir = var.workingDir
      portMappings = [
        {
          containerPort = var.port
          hostPort = var.port
        }
      ]
    }
  ])
  
}

resource "aws_ecs_service" "ecs_service" {
  name = var.ecs_service_name
  cluster = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task.id
  desired_count = var.task_count
  launch_type = "FARGATE"
  scheduling_strategy = "REPLICA"
  force_new_deployment = true

  network_configuration {
    security_groups = [var.security_group]
    subnets = var.subnets
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.lb_target_group
    container_name = var.ecs_task_name
    container_port = var.port
  }

  deployment_circuit_breaker {
    enable = true
    rollback = true
  }
  
}
