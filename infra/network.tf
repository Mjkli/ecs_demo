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
    project = var.project
    env = var.env
    rt_id = module.main_vpc.public_rt_id
}

module "private-subnet-1" {
    source = "../modules/network/subnet"

    vpc_id = module.main_vpc.id
    subnet_cidr = var.private_subnet_1
    project = var.project
    env = var.env
    rt_id = null
  
}

module "private-subnet-1" {
    source = "../modules/network/subnet"

    vpc_id = module.main_vpc.id
    subnet_cidr = var.private_subnet_2
    project = var.project
    env = var.env
    rt_id = null
  
}
