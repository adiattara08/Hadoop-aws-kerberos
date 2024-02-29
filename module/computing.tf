locals {
  private_key_path = "${path.module}/key-manager/${var.key_name}"
}

resource "aws_instance" "jenkins_server" {

  ami = var.ami  //os

  instance_type = var.type // type of instance

  security_groups = [aws_security_group.ec2_inbound_rule.name]  // rules

  key_name = aws_key_pair.ci_cd_key.key_name // pair-key

  tags = {

    Name = var.instance_name

  }
  provisioner "local-exec" {
    command = "chmod 400 ${local.private_key_path}"
  }

}

resource "aws_instance" "kerberos_client" {

  ami = var.ami  //os

  instance_type = "t2.micro" // type of instance

  security_groups = [aws_security_group.ec2_inbound_rule.name]  // rules

  key_name = aws_key_pair.ci_cd_key.key_name // pair-key

  tags = {

    Name = "kerberos-client"

  }

}

resource "aws_instance" "kerberos_server" {

  ami = var.ami  //os

  instance_type = "t2.micro" // type of instance

  security_groups = [aws_security_group.ec2_inbound_rule.name]  // rules

  key_name = aws_key_pair.ci_cd_key.key_name // pair-key

  tags = {

    Name = "kerberos-server"

  }


}

