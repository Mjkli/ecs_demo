module "flask_app" {
    source = "../modules/ecr"
    ecr_name = var.ecr_name
}