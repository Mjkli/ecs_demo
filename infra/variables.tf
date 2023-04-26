# General
variable project {}
variable env {}
variable availability_zone {}
variable availability_zone_2 {}

# VPC
variable vpc_name {}
variable vpc_cidr {}

# subnet-1
variable public_subnet_cidr {}
variable public_subnet_cidr_2 {}

# db instance
variable db_storage {}
variable db_name {}
variable db_engine {}
variable db_version {}
variable db_class {}
variable db_password {}
variable db_username {}

# ecr
variable ecr_name {}

# ecs
variable ecs_name {}
variable entrypoint {}
variable workingdir {}
variable port {}
variable task_count {}

# ecs sg
variable ecs_ingress {}
variable ecs_egress {}

# ecs lb
variable lb_name {}
variable protocol {}

# ecs role
variable ecs_role_name {}

# ecs policy
variable policy_name {}
variable policy_description {}
