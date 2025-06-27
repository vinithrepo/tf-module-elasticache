variable "env" {}
variable "tags" {}
variable "subnet_ids" {}
variable "sg_ingress_cidr" {}
variable "vpc_id" {}
variable "elasticache_type" {}
variable "port" {}
variable "family" {}
variable "engine" {}
variable "node_type" {}
variable "num_cache_nodes" {}
variable "engine_version" {}

#engine               = var.engine
#node_type            = var.node_type
#num_cache_nodes      = var.num_cache_nodes
#parameter_group_name = aws_elasticache_parameter_group.main.name
#engine_version       = var.engine_version