#!/bin/sh

mkdir build
## run the zip command
zip -9r "../build/terraform_test_abcd.zip" "./lambda_scripts/terraform_test.py"

## check files
echo "build: "
ls -laht ../build
