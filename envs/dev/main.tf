provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../modules/vpc"

  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  public_subnets      = var.public_subnets
  private_app_subnets = var.private_app_subnets
  private_db_subnets  = var.private_db_subnets
}

module "app" {
  source = "../../modules/app"

  project_name           = var.project_name
  vpc_id                 = module.vpc.vpc_id
  public_subnet_ids      = module.vpc.public_subnet_ids
  private_app_subnet_ids = module.vpc.private_app_subnet_ids

  instance_type_frontend = var.instance_type_frontend
  instance_type_backend  = var.instance_type_backend
}

module "db" {
  source = "../../modules/db"

  project_name  = var.project_name
  vpc_id        = module.vpc.vpc_id
  db_subnet_ids = module.vpc.private_db_subnet_ids

  db_username = var.db_username
  db_name     = var.db_name

  backend_sg_id = module.app.backend_sg_id
}

# Now pass DB info back to app for future use (optional)
# (If you don't need DB connectivity from backend yet, you can skip these inputs.)

# For now we'll keep app independent (no DB env injection) to avoid circularity.


output "alb_dns_name" {
  value       = module.app.alb_dns_name
  description = "Public ALB DNS name for the frontend"
}

output "frontend_public_ip" {
  value       = module.app.frontend_public_ip
  description = "Public IP of the frontend instance"
}

output "db_endpoint" {
  value       = module.db.db_endpoint
  description = "DB endpoint"
}
