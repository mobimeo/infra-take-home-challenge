module "app" {
  source            = "./lib/terraform-modules/app"
  namespace         = "foo"
}

module "consent_service_postgres" {
  source            = "./lib/terraform-modules/rds-postgres"
  team              = "Foo"
  identifier        = "App"
  instance_class    = "db.t3.small"
  allocated_storage = 20
  username          = "foo"
  password          = "bar"
  subnet_ids        = module.cluster.private_subnets_ids
  vpc_id            = module.cluster.vpc_id
  cidr_blocks       = module.cluster.private_subnets_cidr_blocks
  dns_zone          = module.cluster.internal_r53_zone_id
}
