# resource "aws_instance" "web" {
#   ami           = "ami-053b0d53c279acc90" 
#   instance_type = "t2.micro"
#   count         = 3

#   tags = {
#     Name = element(["prometheus", "grafana", "nodeexplorer"], count.index)
#   }
# }

resource "aws_instance" "web1" {
  ami             = "ami-0f5ee92e2d63afc18"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.TF_SG.name]
  key_name = "cn_v1"

  tags = {
    Name = "prometheus"
  }

  user_data = filebase64("${path.module}/prometheusInstall.sh")

}

resource "aws_instance" "web2" {
  ami             = "ami-0f5ee92e2d63afc18"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.TF_SG.name]
  key_name = "cn_v1"

  tags = {
    Name = "grafana"
  }

  user_data = filebase64("${path.module}/grafanaInstall.sh")

}

# resource "aws_instance" "web3" {
#   ami             = "ami-053b0d53c279acc90"
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

