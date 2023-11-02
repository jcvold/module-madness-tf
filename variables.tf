variable "azs" {
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
  description = "list of availability zones"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "key_name" {
  type        = string
  description = "Name of key pair to use"
}
