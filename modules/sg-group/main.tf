data "aws_vpc" "this" {
  id = var.vpc_id
}

resource "aws_security_group" "nlb_frontend" {
  name        = "${var.resource_name_prefix}-shared-frontend"
  description = "The shared Frontend Security Group for NLB"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.cidr_blocks != [] ? var.cidr_blocks : ["0.0.0.0/0"]

    content {
      from_port   = 5678
      to_port     = 5678
      protocol    = "udp"
      cidr_blocks = [ingress.value]
      description = "Incoming Client Traffic for servicex"
    }
  }

  ingress {
    from_port   = 9001
    to_port     = 9001
    protocol    = "tcp"
    cidr_blocks = concat([data.aws_vpc.this.cidr_block], var.additional_ingress_cidr_blocks)
    description = "Health Check-servicex"
  }

  egress {
    from_port    = 0
    to_port      = 0
    protocol     = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  tags = merge(
    var.required_tags,
    {
      Name = "${var.resource_name_prefix}-shared-frontend"
    }
  )
}



######################### 





