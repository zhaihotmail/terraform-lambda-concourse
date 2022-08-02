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
  #source_code_hash = "${base64sha256(file("./build/terraform_test_abcd.zip"))}"  # local path from where zip is uploaded to s3
  # "main" is the filename within the zip file (main.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
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
}