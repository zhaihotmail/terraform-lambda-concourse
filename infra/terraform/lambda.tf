provider "aws" {
  region = "us-west-1"
  #profile = "saml"
}
resource "random_id" "random" {
  keepers = {
    uuid = uuid()
  }
  byte_length = 8
}

resource "aws_lambda_function" "teraform_test" {
  function_name = "test3"
  s3_bucket = "two00434-b"
  s3_key    = "zips/terraform_test_abcd.zip"            #this is from build.sh which created terraform_test.zip
  #triggers = random_id.random.hex
  # "main" is the filename within the zip file (main.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  handler = "teraform_test.lambda_handler"
  runtime = "python3.8"
  timeout = "600"
  memory_size = 3008
  role = "arn:aws:iam::557563337688:role/zhai-lambda-role"
}

