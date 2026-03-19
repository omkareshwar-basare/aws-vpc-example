locals {
  project     = var.project
  environment = var.environment
  terraform   = true

  vpc_final_tags = merge(
    local.common_tags,
    {
      Name = "${local.project}-${local.environment}-vpc"
    },
    var.vpc_tags
  )

  igw_tags = merge(
    local.common_tags,
    {
      Name = "${local.project}-${local.environment}-igw"
    },
    var.igw_tags
  )
}