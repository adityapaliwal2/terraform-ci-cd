output "vpc_id" {
  value = module.networking.vpc_id
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "ecr_url" {
  value = module.container.ecr_url
}
