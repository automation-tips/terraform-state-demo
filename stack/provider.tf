provider "aws" {
  version = "2.20.0"
  region  = "${var.region}"
  // .bashrcとかに設定 -> AWS_ACCESS_KEY_ID と AWS_SECRET_ACCESS_KEY
  // access_key = ""
  // secret_key = ""
}
