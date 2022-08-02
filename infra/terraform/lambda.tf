provider "aws" {
  region = "us-west-1"
  #profile = "saml"
}

data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_dir  = "${path.module}/../../lambda_scripts/"
  output_path = "./source_code/zipped/terraform_test.zip"
}


resource "aws_lambda_function" "teraform_test" {
  function_name = "test3"
  #s3_bucket = "two00434-b"
  #s3_key    = "zips/terraform_test_abcd.zip"            #this is from build.sh which created terraform_test.zip
  filename="./source_code/zipped/terraform_test.zip"
  handler = "lambda_function.lambda_handler"
  runtime = "python3.8"
  timeout = "600"
  memory_size = 3008
  role = "arn:aws:iam::557563337688:role/zhai-lambda-role"
  #source_code_hash = filebase64sha256("./source_code/zipped/terraform_test.zip")
  environment {
    variables = {
      api_key1="abcdefeg123455",
      api_key2="asdfasdfgafgk354"
    }
  }
  layers = ["arn:aws:lambda:us-west-1:336392948345:layer:AWSDataWrangler-Python38:7"]
}