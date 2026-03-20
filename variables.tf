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

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]     
}

variable "public_subnet_tags" {
  description = "Tags for public subnets"
  type        = map(string)
  default     = {}
}


variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]     
}

variable "private_subnet_tags" {
  description = "Tags for private subnets"
  type        = map(string)
  default     = {}
}

variable "database_subnet_cidrs" {
  description = "List of CIDR blocks for database subnets"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]     
}

variable "database_subnet_tags" {
  description = "Tags for database subnets"
  type        = map(string)
  default     = {}
}


variable "public_route_table_tags" {
  description = "Tags for public route table"
  type        = map(string)
  default     = {}
}

variable "private_route_table_tags" {
  description = "Tags for private route table"
  type        = map(string)
  default     = {}
}

variable "database_route_table_tags" {
  description = "Tags for database route table"
  type     = map(string)
  default  = {}
}

