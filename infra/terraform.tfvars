# General
project = ecs_demo
env = dev

# network
vpc_name = "main-vpc"
vpc_cidr = "10.0.0.0/16"

# subnet
public_subnet_cidr = "10.0.0.0/24"

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



