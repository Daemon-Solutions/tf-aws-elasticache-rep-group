/* Environment variables */
variable "envname" {
  description = "The first name prefix for resources created by this module"
  type        = "string"
}

variable "envtype" {
  description = "The second name prefix for resources created by this module"
  type        = "string"
}

/* VPC variables */
variable "vpc_id" {
  description = "The VPC ID to target security group rules"
  type        = "string"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC specified in 'vpc_id'"
  type        = "string"
}

variable "replication_group_name" {
  description = "The name for this ElastiCache replication group"
  type        = "string"
}

/* Instance specs */
variable "ami" {
  description = "The AMI to use for new replication group instances"
  type        = "string"
  default     = "ami-787a320b"
}

variable "node_type" {
  description = "The instance type to use for new replication group instances"
  type        = "string"
  default     = "cache.m3.medium"
}

/* Cluster specs */
variable "cluster_size" {
  description = "The number of cache clusters this replication group will have"
  type        = "string"
  default     = "3"
}

/* Networking */
variable "private_subnets" {
  description = "List of VPC Subnet IDs for the cache subnet group"
  type        = "list"
  default     = []
}

variable "port" {
  description = "The port to use for ElastiCache"
  type        = "string"
  default     = "6379"
}

/* Engine specs */
variable "engine" {
  description = "Name of the cache engine to be used for this cache cluster. Valid values for this variable are memcached or redis"
  type        = "string"
  default     = "redis"
}

variable "engine_version" {
  description = "Version number of the cache engine to be used"
  type        = "string"
  default     = "3.2.4"
}

variable "parameter_group" {
  description = "Name of the parameter group to associate with this cache cluster"
  type        = "string"
  default     = "default.redis3.2"
}

/* Security */
variable "rest_encryption_enabled" {
  description = "(Optional) Whether to enable encryption at rest"
  type        = "string"
  default     = "false"
}

variable "transit_encryption_enabled" {
  description = "(Optional) Whether to enable encryption in transit"
  type        = "string"
  default     = "false"
}

/* Maintenance */
variable "maintenance_window" {
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed"
  type        = "string"
  default     = "sun:05:00-sun:09:00"
}

variable "snapshot_window" {
  description = "The daily time range (UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster"
  type        = "string"
  default     = "03:00-05:00"
}

variable "snapshot_retention_limit" {
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them"
  type        = "string"
  default     = 5
}
