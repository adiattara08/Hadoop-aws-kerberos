#Algorithm for key-génération
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# générate a pair key
resource "aws_key_pair" "ci_cd_key" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa.public_key_openssh
}

#stock a pair-key
resource "local_file" "ci_cd_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "${path.module}/key-manager/${var.key_name}"
}