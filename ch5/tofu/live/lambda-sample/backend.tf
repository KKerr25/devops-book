terraform {
  backend "s3" {
    # TODO: fill in your own bucket name here!
    bucket         = "kkerr25-tofu-bucket"             
    key            = "ch5/tofu/live/lambda-sample/terraform.tfstate" 
    region         = "us-east-2"                                     
    encrypt        = true                                            
    # TODO: fill in your own DynamoDB table name here!
    dynamodb_table = "kkerr25-tofu-bucket"             
  }
}