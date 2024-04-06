variable "cidr_block" {
   # default = "10.0.0.0/16"
   type = string
  
}

variable "common_tags" {
    default = {} # this is optional
  
}

variable "vpc_tags" {
    default = {} # this is optional
  
}
variable "enable_dns_support" {
    type = bool
    default = true
  
}

variable "enable_dns_hostnames" {
   type = bool
   default = true
}

variable "public_cidr" {
    type = list

  
}
variable "public_subnet_names" {
    type = list
  
}

variable "azs" {
  type = list
}
variable "igw_tags" {
    default = {} # this is optionl
  
}

variable "private_cidr" {
    type = list

  
}
variable "private_subnet_names" {
    type = list
  
}
variable "database_cidr" {
    type = list

  
}
variable "database_subnet_names" {
    type = list
  
}
variable "public_rt_tags" {
  default = {}
}
variable "igw_r_cidr" {
    default = "0.0.0.0/0"
  
}
variable "private_rt_tags" {
    default = {}
  
}
variable "database_rt_tags" {
    default = {}
  
}