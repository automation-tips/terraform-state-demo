resource "aws_autoscaling_group" "my_asg" {
  launch_configuration = "${aws_launch_configuration.my_launch_conf.id}"
  # マルチAZ
  availability_zones = "${var.azs}"
  # 下限
  min_size = 1
  # 上限
  max_size = 4
  # 必要インスタンス数（常時起動数）
  desired_capacity = 1

  tag {
    key                 = "Name"
    value               = "terraform-asg"
    propagate_at_launch = true
  }
}
