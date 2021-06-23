variable "identifier" {
  description = "Database identifier / Database name"
  validation {
    condition     = can(regex("[A-Za-z0-9]", var.identifier))
    error_message = "DBName must begin with a letter and contain only alphanumeric characters."
  }
}

variable "database_name" {
  type        = string
  default     = null
  description = "The name of the database to create when the DB instance is created."
}

variable "instance_class" {
  description = "Instance class, e.g. db.t2.large..."
}

variable "allocated_storage" {
  type        = string
  default     = null
  description = "Allocated storage size in Gb"
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key."
  default     = ""
}

variable "username" {
  type      = string
  sensitive = true
  validation {
    condition     = can(regex("[A-Za-z0-9]", var.username))
    error_message = "DB UserName must begin with a letter and contain only alphanumeric characters."
  }
}

variable "password" {
  type      = string
  sensitive = true
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  default     = false
}

variable "subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(any)
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "cidr_blocks" {
  type        = list(string)
  description = "cidr blocks allowed to connect to RDS"
}

variable "dns_zone" {
  description = "Route 53 zone ID to create record in"
}

variable "team" {
  description = "Used for cost allocations"
  default     = "NONE"
}

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true"
  default     = true
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  default     = false
}

variable "snapshot_identifier" {
  type        = string
  default     = null
  description = "Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console"
}

variable "parameters" {
  description = "A list of DB parameter maps to apply"
  type        = list(map(string))
  default     = []
}
