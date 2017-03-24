resource "aws_security_group" "elasticache-repgroup-sg" {
  name        = "${var.name}"
  description = "Elasticache security group for ${var.name}"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group_rule" "elasticache-repgroup-in" {
    type              = "ingress"
    protocol          = "tcp"
    from_port         = "${var.port}"
    to_port           = "${var.port}"
    security_group_id = "${aws_security_group.elasticache-repgroup.id}"
    cidr_blocks       = ["${var.vpc_cidr}"]
  }

resource "aws_elasticache_replication_group" "elasticache-repgroup" {
  replication_group_id          = "${var.name}"
  replication_group_description = "${var.envname}-sensu-elasticache-replication-group"
  node_type                     = "${var.node_type}"
  number_cache_clusters         = "${var.cluster_size}"
  port                          = "${var.port}"
  engine_version                = "${var.engine_version}"
  parameter_group_name        = "${var.parameter_group}"
  subnet_group_name             = "${aws_elasticache_subnet_group.sensu_elasticache.name}"
  security_group_ids            = ["${aws_security_group.sensu-elasticache-repgroup-sg.id}"]
  apply_immediately             = true

  resource "aws_elasticache_subnet_group" "sensu_elasticache" {
  name        = "${var.envname}-sensu-elasticache"
  description = "${var.envname}-sensu-elasticache"
  subnet_ids  = ["${module.app_vpc.private_subnets}"]
}
