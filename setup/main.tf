/**
 * state管理用のS3 & DynamoDB 作成用スタック
 * stack ディレクトリ内のtf実行前にこちらを先に実行する
*/

terraform {
  required_version = "0.12.5"
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_s3_bucket" "terraform_state" {
  // ダメだったら別の名前にする
  bucket = "terraform-state-kento75"
  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform_state_lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    // 必須
    name = "LockID"
    type = "S"
  }
}
