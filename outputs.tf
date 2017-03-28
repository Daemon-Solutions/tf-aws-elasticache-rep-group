output "endpoint" {
  value = "${aws_elasticache_replication_group.elasticache-repgroup.primary_endpoint_address}"
}
