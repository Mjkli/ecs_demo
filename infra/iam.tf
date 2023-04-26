data "aws_iam_policy_document" "ecs_role_policy" {
    statement {
      effect = "Allow"
      principals {
        type = "Service"
        identifiers = [ "ecs-tasks.amazonaws.com" ]
      }
      actions = ["sts:AssumeRole"]
    }
}

data "aws_iam_policy_document" "ecs_policy" {
    statement {
      actions = ["rds-db:connect"]
      effect = "Allow"
      resources = ["${module.db.arn}"]
    }
}

module "ecs_role" {
    source = "../modules/iam/roles"
    role_name = var.ecs_role_name
    role_policy = data.aws_iam_policy_document.ecs_role_policy.json
    project = var.project
    env = var.env
}

resource "aws_iam_role_policy_attachment" "ecsTaskExecutionPolicy" {
  role = module.ecs_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

module "ecs_policy" {
    source = "../modules/iam/policies"

    policy_name = var.policy_name
    policy_description = var.policy_description
    policy_json = data.aws_iam_policy_document.ecs_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_db_access" {
    role = module.ecs_role.name
    policy_arn = module.ecs_policy.arn
  
}