######################### VPC and subnet ########################################
# get default vpc
data "aws_vpc" "default_vpc" {
  default = true
}

# get default subnet of the vpc
data "aws_subnet_ids" "default_subnet" {
  vpc_id = data.aws_vpc.default_vpc.id
}

# create ec2 security group
resource "aws_security_group" "ec2_inbound_rule" {
  description = "Implements some security"
  #http
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #htpps
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #jenkins port
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ## hadoop port
  ingress {
    from_port   = 9870
    to_port     = 9870
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ## hadoop port
  ingress {
    from_port   = 8088
    to_port     = 8088
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ## hadoop port
    ingress {
      from_port   = 1004
      to_port     = 1004
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
      ## hadoop port
    ingress {
          from_port   = 1006
          to_port     = 1006
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
    }
  #ssh port
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 88
    to_port     = 88
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with your client's IP address or specify the security group ID
  }

  ingress {
    from_port   = 8  # ICMP type for echo request (ping)
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"] # Replace with your client's IP address or specify the security group ID
  }

  #out bound rule
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins-access"
  }

}
