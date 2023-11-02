module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  name = "single-instance"

  instance_type = "t2.micro"
  # ami = 
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = [module.http_80_security_group.security_group_id, module.ssh_security_group.security_group_id]
  subnet_id              = element(module.vpc.public_subnets, 0)

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
