/* VPC/Environment variables */
variable "customer"              {}
variable "envname"               {}
variable "envtype"               {}
variable "key_name"              {}
variable "vpc_id" {}
variable "vpc_cidr" {}

variable "name" { default = "" }

/* Instance specs */
variable "ami" {
	default = "ami-787a320b"
}

variable "instance_type" {
  default = "cache.m3.medium"
}

/* Cluster specs */
variable "number_cache_clusters" {
	default = "3"
}

/* Networking */
variable "subnets" {
  type = "list"
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

variable "parameter_group_name" {
  default = "default.redis3.2"
}

/* Maintenance */
variable "snapshot_window" {}

variable "snapshot_retention_limit" {}
