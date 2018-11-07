resource "aws_security_group" "elasticache-repgroup-sg" {
  name        = "${var.replication_group_name}"
  description = "Elasticache security group for ${var.replication_group_name}"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group_rule" "elasticache-repgroup-in" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = "${var.port}"
  to_port           = "${var.port}"
  security_group_id = "${aws_security_group.elasticache-repgroup-sg.id}"
  cidr_blocks       = ["${var.vpc_cidr}"]
}

resource "aws_elasticache_replication_group" "elasticache-repgroup" {
  replication_group_id          = "${var.envname}-${var.envtype}-${var.replication_group_name}"
  replication_group_description = "${var.envname}-${var.replication_group_name}-elasticache-replication-group"
  node_type                     = "${var.node_type}"
  number_cache_clusters         = "${var.cluster_size}"
  port                          = "${var.port}"
  engine_version                = "${var.engine_version}"
  parameter_group_name          = "${var.parameter_group}"
  subnet_group_name             = "${aws_elasticache_subnet_group.elasticache-repgroup.name}"
  security_group_ids            = ["${aws_security_group.elasticache-repgroup-sg.id}"]
  apply_immediately             = true
  at_rest_encryption_enabled    = "${var.rest_encryption_enabled}"
  transit_encryption_enabled    = "${var.transit_encryption_enabled}"
  maintenance_window            = "${var.maintenance_window}"
  snapshot_window               = "${var.snapshot_window}"
  snapshot_retention_limit      = "${var.snapshot_retention_limit}"
}

resource "aws_elasticache_subnet_group" "elasticache-repgroup" {
  name        = "${var.envname}-${var.replication_group_name}-elasticache"
  description = "${var.envname}-${var.replication_group_name}-elasticache"
  subnet_ids  = ["${var.private_subnets}"]
}
