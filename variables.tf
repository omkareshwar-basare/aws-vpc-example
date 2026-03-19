variable "project" {
  description = "Project name for tagging resources"
  type        = string
}

variable "environment" {
  description = "Environment name for tagging resources"
  type        = string
}



variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default = {}
}

variable "igw_tags" {
  description = "Tags for the Internet Gateway"
  type        = map(string)
  default = {}
}
