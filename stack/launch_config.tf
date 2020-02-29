resource "aws_launch_configuration" "my_launch_conf" {
  name            = "webserver-launch"
  image_id        = "${var.ami}"
  instance_type   = "${var.instance_type}"
  security_groups = ["${aws_security_group.webserver_sg.id}"]

  # 前もって作っておく
  key_name = "terraform"

  # Apacheサーバーのインストール -> 起動
  user_data = <<EOF
#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
/usr/bin/apt-get update
DEBIAN_FRONTEND=noninteractive /usr/bin/apt-get upgrade -yq
/usr/bin/apt-get install apache2 -y
/usr/sbin/ufw allow in "Apache Full"
/bin/echo "Hello world " >/var/www/html/index.html
echo $instance_ip >>/var/www/html/index.html
EOF
}
