run "deploy" {
  command = apply
}

run "validate" {
  command = apply

  module {
    source  = "brikis98/devops/book//modules/test-endpoint"
    version = "1.0.0"
  }

  variables {
    endpoint = run.deploy.function_url
    name        = "lambda-sample"
    src_dir     = "../src"
    runtime     = "python3.12"
    handler     = "app.lambda_handler"
    memory_size = 128
    timeout     = 10
  }

  assert {
    condition     = data.http.test_endpoint.status_code == 200
    error_message = "Unexpected status: ${data.http.test_endpoint.status_code}"
  }

  assert {
    condition     = data.http.test_endpoint.response_body == "Fundamentals of DevOps!"
    error_message = "Unexpected body: ${data.http.test_endpoint.response_body}"
  }
}