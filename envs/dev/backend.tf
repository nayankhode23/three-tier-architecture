terraform {
  backend "s3" {
    bucket         = "three-tier-app-terraform-state-dev"
    key            = "envs/dev/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    #dynamodb_table = "three-tier-terraform-locks" # comment this if you don't use DynamoDB
  }
}
