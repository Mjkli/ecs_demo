module "main_vpc" {
    source = "../modules/network/vpc"

    vpc_name = var.vpc_name
    vpc_cidr_block = var.vpc_cidr
    project = var.project
    env = var.env
  
}

module "public-subnet-1" {
    source = "../modules/network/subnet"

    vpc_id = module.main_vpc.id
    subnet_cidr = var.public_subnet_cidr
    availability_zone = var.availability_zone
    project = var.project
    env = var.env
    rt_id = module.main_vpc.public_rt_id
}

module "public-subnet-2" {
    source = "../modules/network/subnet"

    vpc_id = module.main_vpc.id
    subnet_cidr = var.public_subnet_cidr_2
    availability_zone = var.availability_zone_2
    project = var.project
    env = var.env
    rt_id = module.main_vpc.public_rt_id
}