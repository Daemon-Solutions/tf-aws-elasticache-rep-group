To be used in conjuction with, for example, Sensu.

The TF-AWS-SENSU module with this module will require:

```
envname                    = "${var.envname}"
envtype                    = "${var.envtype}"
customer                   = "${var.customer}"
private_subnets            = "${module.vpc.private_subnets}"
public_subnets             = "${module.vpc.public_subnets}"
vpc_id                     = "${module.vpc.vpc_id}"
vpc_cidr                   = "${module.vpc.vpc_cidr}"
allowed_remote_cidrs       = "${var.allowed_remote_cidrs}"
security_groups            = "${var.security_groups}"
key_name                   = "${var.key_name}"
sensu_userdata             = "<script>${data.template_file.sensu_userdata.rendered}</script>"
subnets                    = "${module.vpc.public_subnets}"
min                        = "${length(module.vpc.public_subnets)}"
max                        = "${length(module.vpc.public_subnets)}"
parameter_group            = "${var.parameter_group}"
engine_version             = "${var.engine_version}"
at_rest_encryption_enabled = "true"
maintenance_window         = "sun:03:00-sun:04:00"
snapshot_window            = "01:00-08:00"
snapshot_retention_limit   = "7"

replication_group_name = "${var.replication_group_name}"
cluster_size           = "3"
```

The required fields for the replication group module are:

`replication_group_name` the name of the replication group <br/>
`vpc_id` VPC ID to target security group rules <br/>
`vpc_cidr` the CIDR block for the VPC specified <br/>
`private subnets` a list of subnets to pass <br/>

The following are defaults: <br/>
`ami` ami-787a320b <br/>
`node type` cache.m3.medium <br/>
`cluster size` 3 <br/>
`port` 6379 <br/>
`engine` redis <br/>
`engine version` 3.2.4 <br/>
`parameter_group` default.redis3.2 <br/>
`maintenance_window` sun:05:00-sun:09:00 <br/>
`snapshot_window` 03:00-05:00 <br/>
`snapshot_retention_limit` 5 <br/>
