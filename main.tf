provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = "adi-terraform-remote-state-001"
    key            = "infra/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

module "networking" {
  source   = "./modules/networking"
  vpc_cidr = var.vpc_cidr
}

module "s3_iam" {
  source          = "./modules/s3_iam"
  bucket_name     = var.bucket_name
  tf_state_bucket = var.tf_state_bucket
  tf_lock_table   = var.tf_lock_table
}

module "ec2" {
  source               = "./modules/ec2"
  subnet_id            = module.networking.public_subnet_id
  iam_instance_profile = module.s3_iam.instance_profile
}

module "container" {
  source     = "./modules/container"
  vpc_id     = module.networking.vpc_id
  subnet_ids = module.networking.private_subnet_ids
}
