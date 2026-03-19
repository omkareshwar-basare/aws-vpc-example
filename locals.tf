locals {
  project     = var.project
  environment = var.environment
  terraform   = true

  vpc_final_tags = merge(
    {
      Name = "${local.project}-${local.environment}-vpc"
    },
    var.vpc_tags
  )

  igw_tags = merge(
    {
      Name = "${local.project}-${local.environment}-igw"
    },
    var.igw_tags
  )


az_names = slice(data.aws_availability_zones.available.names, 0, 2)
 
}