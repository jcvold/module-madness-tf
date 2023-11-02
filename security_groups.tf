module "http_80_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "~> 5.0"

  name        = "web-server"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "ssh_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "~> 5.0"

  name        = "ssh"
  description = "Security group for ssh ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}
