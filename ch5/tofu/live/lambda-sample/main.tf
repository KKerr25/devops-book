provider "aws" {
  region = "us-east-2"
}

module "function" {
  source  = "github.com/KKerr25/devops-book//ch5/live/tofu/lambda-sample"
  version = "1.0.0"

  name = var.name

  src_dir = "${path.module}/src"
  runtime = "nodejs20.x"
  handler = "index.handler"

  memory_size = 128
  timeout     = 5

  environment_variables = {
    NODE_ENV = "production"
  }

  create_url = true
}
