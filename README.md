# ecs_demo
Demo of terraform and leveraging AWS ECS fargate
z
# Goal
Terraform should establish ecr, ecs cluster, and task to run images.
ECS cluster should scale based on type of traffic is routed to it. 
For now web traffic will be used.  Github actions should be able to deploy infrastructure and any updates to docker images.

For this project we will have a simple dockerized flask app that references an sql database to return values stored.

# Terraform
I use modules and variables to define all configuration variables on one file. This makes it easy to make minor adjustments when updating.
Although any major changes will have to include adjusting the modules. 
