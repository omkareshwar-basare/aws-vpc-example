locals {
  project = var.project
  environment = var.environment
  terraform = true
}

vpc_final_tags = merge(
  {
    Name = "${local.project}-${local.environment}-vpc"
  },
  var.vpc_tags
)