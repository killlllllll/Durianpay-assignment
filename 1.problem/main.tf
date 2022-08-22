provider "aws" {
 region = "us-east-1"
}



module "services" {
    source                       =  "./services"
    vpc-cidr                     = var.vpc-cidr
    public_subnet                = var.public_subnet
    private_subnet               = var.private_subnet
    instance_type                = var.instance_type
    template_name                = var.template_name
    shutdown_behaviour           = var.shutdown_behaviour
    asg_name                     = var.asg_name
    health_check_type            = var.health_check_type
    health_period                = var.health_period
    min_size                     = var.min_size
    max_size                     = var.max_size
    target_value                 = var.target_value
    alarm_name                   = var.alarm_name
    comparison_operator          = var.comparison_operator
    evaluation_periods           = var.evaluation_periods
    metric_name                  = var.metric_name
    namespace                    = var.namespace
    period                       = var.period
    statistic                    = var.statistic
    threshold                    = var.threshold
    securitygroup_name           =var.securitygroup_name
    from_port                    = var.from_port
    to_port                      = var.to_port
    protocol                     = var.protocol
    cidr_blocks                  = var.cidr_blocks
    egress_port                  = var.egress_port
    egress_protocol              = var.egress_protocol
    public_subnet_name           = var.public_subnet_name
    private_subnet_name          = var.private_subnet_name
    instance_tenancy             = var.instance_tenancy
    vpc_name                     = var.vpc_name
    igw_name                     = var.igw_name
    nat_name                     = var.nat_name
    company                      = var.company
    owner                        = var.owner
    created_by                   = var.created_by
    private_route                = var.private_route
    public_route                 = var.public_route
    aws_region                   = var.aws_region
    route_cidr                   = var.route_cidr 
    key_name = var.key_name
    alarm_description = var.alarm_description 









}