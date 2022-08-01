import json
import sys, os
import boto3

s3 = boto3.client('s3')
s3 = boto3.resource('s3')

def lambda_handler(event, context):
    s3.Bucket('x').download_file("abc.csv", "/tmp/example.csv")
    boto3.resource('s3').Bucket('x').upload_file("/tmp/example.csv", 'teraform_test/' + "example.csv")
    print("I made some change here")
    print("change at 8:34am")
    print("change at 9am")
    print("change at 9:12")
