variable "vpc-cidr" {
  default       = "10.0.0.0/16"
  description   = "VPC CIDR Block"
  type          = string
}

variable "public-subnet-1-cidr" {
  default       = "10.0.1.0/24"
  description   = "Public Subnet 1 CIDR Block"
  type          = string
}

variable "public-subnet-2-cidr" {
  default       = "10.0.2.0/24"
  description   = "Public Subnet 2 CIDR Block"
  type          = string
}

variable "private-subnet-1-cidr" {
  default       = "10.0.3.0/24"
  description   = "Private Subnet 1 CIDR Block"
  type          = string
}

variable "db_username" {
  description = "Database administrator username"
  type = string
  sensitive = true
}

variable "db_password" {
  description = "Database administrator password"
  type = string
  sensitive = true
}

variable "edub-lb" {
  description = "the name of the load balancer"
  type = string 
  default = "edub_lb"
}

