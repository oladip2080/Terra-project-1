resource "aws_instance" "mongo" {
  ami                    = "ami-02868af3c3df4b3aa"
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]

  /*
  user_data = << EOF
  #! /bin/bash
  sudo apt-get update
  sudo apt-get install -y nginx
  sudo systemctl start nginx
  sudo systemctl enable nginx
  echo "<h1>Ayodeji 2022</h1>" | sudo tee /var/www/html/index.html
	EOF
  */

  user_data = filebase64("${path.module}/install.sh")

  tags = {
    Name  = "Mongo"
    Owner = "Ayodeji"
  }
}
