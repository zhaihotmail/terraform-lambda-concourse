provider "aws" {
  region = "us-west-1"
  #profile = "saml"
}

resource "random_id" "id" {
	  byte_length = 8
}



data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_dir  = "${path.module}/../../lambda_scripts/"
  output_path = "./source_code/zipped/terraform_test-${random_id.id.hex}.zip"
}



#resource "aws_lambda_function" "lambda" {
#	function_name = "${random_id.id.hex}-function"
#	# ...
#}

resource "aws_lambda_function" "teraform_test" {
  function_name = "test3"
  #s3_bucket = "two00434-b"
  #s3_key    = "zips/terraform_test_abcd.zip"            #this is from build.sh which created terraform_test.zip
  #source_code_hash = "${base64sha256(file("./build/terraform_test_abcd.zip"))}"  # local path from where zip is uploaded to s3
  #triggers = random_id.random.hex
  # "main" is the filename within the zip file (main.js) and "handler"
  # is the name of the property under which the handler function was
  # exported in that file.
  filename = "./source_code/zipped/terraform_test-${random_id.id.hex}.zip"
  handler = "teraform_test.lambda_handler"
  runtime = "python3.8"
  timeout = "600"
  memory_size = 3008
  role = "arn:aws:iam::557563337688:role/zhai-lambda-role"
}