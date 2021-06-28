# terraform {
#   backend "s3" {
#     bucket = "assignment-tf-statefile-uat"
#     key    = "tfstate"
#     region = "ap-south-1"
#   }
# }

provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "../../modules/aws/vpc-2"
  name = "vpc-${var.environment}"
  cidr_block = var.cidr_block
  environment = var.environment
  web_sg_id = module.sgs.web_sg_id
}

module "sgs" {
  source = "../../modules/aws/security-groups"
  vpc_id = module.vpc.id
  app_name = "${var.app_name}"
  environment = var.environment
}

module "nlb" {
  source = "../../modules/aws/nlb"
  app_name = "${var.app_name}"
  environment = "${var.environment}"
  vpc_id = module.vpc.id
  alb_security_groups = module.sgs.alb_id
  subnet_ids = module.vpc.public_subnet_ids
  instance_id = module.vpc.ec2_instance_id
}
