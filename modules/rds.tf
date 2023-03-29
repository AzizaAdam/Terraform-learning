resource "aws_rds_cluster_instance" "instancesdb" {
  count              = 2
  identifier         = "aurora-cluster-dev-${count.index}"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = "db.r4.large"
  engine             = aws_rds_cluster.default.engine
  engine_version     = aws_rds_cluster.default.engine_version
}

resource "aws_rds_cluster" "default" {
  cluster_identifier = "aurora"
  engine                  = "aurora-mysql"
  availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  database_name      = "dbdev"
  master_username    = var.master_username
  master_password    = var.master_password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}


