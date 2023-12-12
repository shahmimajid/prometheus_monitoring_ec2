resource "aws_instance" "prometheus" {
  ami             = "ami-078c1149d8ad719a7"
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.TF_SG.name]
  key_name = "tfkeys"
  

  tags = {
    Name = "prometheus"
  }

  user_data = filebase64("${path.module}/prometheusInstall.sh")

}

resource "aws_instance" "grafana" {
  ami             = "ami-078c1149d8ad719a7"
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.TF_SG.name]
  key_name = "tfkeys"

  tags = {
    Name = "grafana"
  }

  user_data = filebase64("${path.module}/grafanaInstall.sh")

}

# resource "aws_instance" "web3" {
#   ami             = "ami-078c1149d8ad719a7"
#   instance_type   = "t2.micro"
#   security_groups = [aws_security_group.TF_SG.name]
#   key_name = "devopsKP"

#   tags = {
#     Name = "nodeexporter"
#   }

#     user_data = base64encode(join("", [
#     file("${path.module}/nginxInstall.sh"),
#     file("${path.module}/nodeexporterInstall.sh"),
#   ]))

# }

