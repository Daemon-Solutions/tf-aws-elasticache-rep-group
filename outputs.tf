output "endpoint" {
  value = "${aws_elasticache_replication_group.elasticache-repgroup.primary_endpoint_address}"
}

output "configuration_endpoint" {
  value = "${aws_elasticache_replication_group.elasticache-repgroup.configuration_endpoint_address}"
}
