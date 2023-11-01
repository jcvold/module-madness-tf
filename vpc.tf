module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"
  name    = "my-vpc"
  cidr    = "10.0.0.0/16"

  azs             = var.azs[*]
  private_subnets = var.private_subnets[*]
  public_subnets  = var.public_subnets[*]

  enable_nat_gateway  = true
  single_nat_gateway  = true
  reuse_nat_ips       = true
  external_nat_ip_ids = aws_eip.nat.*.id

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_eip" "nat" {
  count = 1

  domain = "vpc"
}
