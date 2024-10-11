module "vpc" {
  source = "./modules/vpc"
  cidr   = var.cidr
}

module "web_security_group" {
  source = "./modules/security_group"
  name   = "web"
  vpc_id = module.vpc.vpc_id
}

module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = "mukulterraform2023project"
}

module "webserver1" {
  source            = "./modules/ec2_instance"
  ami               = "ami-0866a3c8686eaeeba"
  instance_type     = "t2.micro"
  security_group_id = module.web_security_group.security_group_id
  subnet_id         = module.vpc.subnet1_id
  user_data         = base64encode(file("userdata_1.sh"))
  instance_name     = "webserver1"
}

module "webserver2" {
  source            = "./modules/ec2_instance"
  ami               = "ami-0866a3c8686eaeeba"
  instance_type     = "t2.micro"
  security_group_id = module.web_security_group.security_group_id
  subnet_id         = module.vpc.subnet2_id
  user_data         = base64encode(file("userdata_2.sh"))
  instance_name     = "webserver2"
}

module "alb" {
  source             = "./modules/alb"
  name               = "myalb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.web_security_group.security_group_id]
  subnets            = [module.vpc.subnet1_id, module.vpc.subnet2_id]

  tags = {
    name = "web"
  }
}

module "target_group" {
  source            = "./modules/target_group"
  name              = "mytg"
  port              = 80
  protocol          = "HTTP"
  vpc_id            = module.vpc.vpc_id
  health_check_path = "/"
  health_check_port = "traffic-port"
}

module "target_group_attachment_1" {
  source           = "./modules/target_group_attachment"
  target_group_arn = module.target_group.tg_arn
  target_id        = module.webserver1.instance_id
  port             = 80
}

module "target_group_attachment_2" {
  source           = "./modules/target_group_attachment"
  target_group_arn = module.target_group.tg_arn
  target_id        = module.webserver2.instance_id
  port             = 80
}

module "alb_listener" {
  source            = "./modules/alb_listener"
  load_balancer_arn = module.alb.alb_arn
  target_group_arn  = module.target_group.tg_arn
  port              = 80
  protocol          = "HTTP"
}