# General
project = "ecs_demo"
env = "dev"
availability_zone = "us-west-1a"
availability_zone_2 = "us-west-1b"

# network
vpc_name = "main-vpc"
vpc_cidr = "10.0.0.0/16"

# subnets
public_subnet_cidr = "10.0.0.0/24"
public_subnet_cidr_2 = "10.0.1.0/24"

# db instance
db_storage = 10
db_name = "test_db"
db_engine = "mysql"
db_version = "8.0.32"
db_class = "db.t2.micro"

# ECR
ecr_name = "flask_app"

# ECS
ecs_name = "ecs-demo"
entrypoint = [ "flask","run","--host=0.0.0.0" ]   # Already set in the docker image but available to change if need be. 
workingdir = "/"
port = 5000
task_count = 3

# ecs sg
ecs_ingress = [{
     from_port = 5000
     to_port = 5000
     protocol = "TCP"
     cidr_blocks = ["0.0.0.0/0"]
}]
ecs_egress = [{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

}]

# ecs role
ecs_role_name = "ecs-demo-role"

# ecs policy
policy_name = "ecs-demo-db-access"
policy_description = "Access to the ecs demo db"

# ecs lb
lb_name = "ecs-demo-lb"
protocol = "HTTP"

