output "vpc_id" {
  value = module.vpc.vpc_id
}

output "default_route_table_id" {
  value = module.vpc.default_route_table_id
}

output "cidr_block" {
  value = module.vpc.cidr_block
}

