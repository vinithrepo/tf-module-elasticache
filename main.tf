resource "aws_elasticache_subnet_group" "main" {
  name       = "${local.name_prefix}-subnet-group"
  subnet_ids = var.subnet_ids
  tags       = merge(local.tags, { Name = "${local.name_prefix}-subnet-group" })
}

resource "aws_security_group" "main" {
  name        = "${local.name_prefix}-sg"
  description = "${local.name_prefix}-sg"
  vpc_id      = var.vpc_id
  tags        = merge(local.tags, { Name = "${local.name_prefix}-sg" })

  ingress {
    description = "ELASTICACHE"
    from_port   = var.port
    protocol    = "tcp"
    to_port     = var.port
    cidr_blocks = var.sg_ingress_cidr
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_elasticache_parameter_group" "main" {
  name   = "${local.name_prefix}-pg"
  family = var.family

}
resource "aws_elasticache_cluster" "main" {
  cluster_id           = "${local.name_prefix}-cluster"
  engine               = var.engine
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = aws_elasticache_parameter_group.main.name
  engine_version       = var.engine_version
  port                 = var.port
  subnet_group_name    = aws_elasticache_subnet_group.main.name
  security_group_ids   = [aws_security_group.main.id]

  tags = merge(local.tags, { Name = "${local.name_prefix}-cluster" })
}



