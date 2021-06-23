module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "2.33.0"

  identifier           = var.identifier
  engine               = "postgres"
  engine_version       = "11.10"
  family               = "postgres11"
  major_engine_version = "11"

  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = "gp2"
  storage_encrypted = true
  kms_key_id        = var.kms_key_id

  name     = var.snapshot_identifier == null ? replace(coalesce(var.database_name, var.identifier), "/[^0-9A-Za-z]/", "") : null
  username = var.username
  password = var.password
  port     = 5432

  multi_az               = var.multi_az
  subnet_ids             = var.subnet_ids
  vpc_security_group_ids = [aws_security_group.rds.id]

  maintenance_window                    = "Mon:03:00-Mon:04:00"
  backup_window                         = "02:00-02:59"
  enabled_cloudwatch_logs_exports       = ["postgresql", "upgrade"]
  backup_retention_period               = 6
  skip_final_snapshot                   = var.skip_final_snapshot
  deletion_protection                   = var.deletion_protection
  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_role_name                  = "${var.identifier}-monitoring-role"
  monitoring_interval                   = 60
  tags                                  = local.tags
  snapshot_identifier                   = var.snapshot_identifier

  parameters = var.parameters
}
