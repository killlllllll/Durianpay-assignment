variable "vpc-cidr" {
description = "VPC CIDR BLOCK"
type = string
}
variable "aws_region" {
  description = "aws region"
  type = string
}

variable "public_subnet" {
description = "Public_Subnet_1a"
type = string
}

variable "private_subnet" {
description = "Private_Subnet_1a"
type = string
}

variable "company" {
description = "company_name"
type = string
}

variable "owner" {
description = "owner_name"
type = string
}

variable "created_by" {
description = "name of the person who created code"
type = string
}


variable "key_name" {
description = "Name of keypair to ssh"
type = string
}

variable "instance_type" {
type        = string
}

variable "template_name" {}

variable "shutdown_behaviour" {}

variable "asg_name" {}

variable "health_check_type" {}

variable "health_period" {}

variable "min_size" {}

variable "max_size" {}

variable "target_value" {}

variable "alarm_name" {}

variable "comparison_operator" {}

variable "evaluation_periods" {}

variable "metric_name" {}

variable "namespace" {}

variable "period" {}


variable "statistic" {}


variable "threshold" {}

variable "alarm_description" {}

variable "route_cidr" {}

variable "public_route" {}

variable "private_route" {}

variable "securitygroup_name" {}

variable "from_port" {}

variable "to_port" {}

variable "protocol" {}

variable "cidr_blocks" {}

variable "egress_port" {}

variable "egress_protocol" {}

variable "public_subnet_name" {}

variable "private_subnet_name" {}

variable "instance_tenancy"  {}

variable "vpc_name" {}

variable "igw_name" {}

variable "nat_name" {}
