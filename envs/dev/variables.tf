variable "project_name" {
  type        = string
  description = "Project name prefix for resources"
  default     = "three-tier-app"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnet CIDRs (2 AZs)"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_app_subnets" {
  type        = list(string)
  description = "Private subnets for app/backend layer"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "private_db_subnets" {
  type        = list(string)
  description = "Private subnets for DB layer"
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "db_username" {
  type        = string
  description = "DB master username"
  default     = "appuser"
}

variable "db_name" {
  type        = string
  description = "Initial database name"
  default     = "appdb"
}

variable "instance_type_frontend" {
  type        = string
  description = "Frontend EC2 instance type"
  default     = "t3.micro"
}

variable "instance_type_backend" {
  type        = string
  description = "Backend EC2 instance type"
  default     = "t3.micro"
}
