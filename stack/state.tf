terraform {
  required_version = "0.12.5"

  // state lock 設定
  // state管理用 S3, DynamoDB は別管理
  backend "s3" {
    bucket         = "terraform-state-kento75" # state管理用バケット
    region         = "ap-northeast-1"
    key            = "terraform.tfstate"
    encrypt        = true
    dynamodb_table = "terraform_state_lock"
  }
}
