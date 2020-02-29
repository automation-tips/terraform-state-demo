// state管理用 S3バケット
variable "backend_backet" {
  default = "terraform-state-kento75"
}

// state管理用 DynamoDB table名
variable "backend_state_lock" {
  default = "terraform_state_lock"
}
variable "region" {
  default = "ap-northeast-1"
}

variable "http_port" {
  default = 80
}
variable "ssh_port" {
  default = 22
}

# ここは適宜変更する
# curl https://checkip.amazonaws.com で調べる
variable "my_system" {
  default = "0.0.0.0/0"
}

variable "ami" {
  # 東京リージョンの Ubuntu 16 LTS x86
  default = "ami-03344c819e1ac354d"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "azs" {
  default = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}
