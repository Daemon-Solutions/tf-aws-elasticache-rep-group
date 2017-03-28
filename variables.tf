/* VPC/Environment variables */
variable "customer" {}
variable "envname" {}
variable "envtype" {}
variable "key_name" {}
variable "vpc_id" {}
variable "vpc_cidr" {}

variable "replication_group_name" {}

/* Instance specs */
variable "ami" {
  default = "ami-787a320b"
}

variable "node_type" {
  default = "cache.m3.medium"
}

/* Cluster specs */
variable "cluster_size" {
  default = "3"
}

/* Networking */
variable "private_subnets" {
  type    = "list"
  default = []
}

variable "port" {
  default = "6379"
}

/* Engine specs */
variable "engine" {
  default = "redis"
}

variable "engine_version" {
  default = "3.2.4"
}

variable "parameter_group" {
  default = "default.redis3.2"
}

/* Maintenance */
variable "snapshot_window" {}

variable "snapshot_retention_limit" {}
