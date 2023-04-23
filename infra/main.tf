provider "aws"{
    region = "us-west-1"
}

terraform {
  backend "s3"{
    encrypt = true
    bucket = "state-storage-mjkli"
    key = "ecs-demo-tf-state"
    region = "us-west-1"
  }
}
