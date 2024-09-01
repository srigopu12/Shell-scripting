#!/bin/bash
#####################################################################
#This script will list all the resources in the aws account
#Author: srilakshmi
#Version : v0.0.1
#
# Following are the supported AWS services by the script
# 1.Ec2
# 2.S3
# 3.RDS
# 4. DynamoDB
# 5.Lambda
# 6.EBS
# 7.ELB
# 8.Cloudfront
# 9.CloudWatch
# 10.SNS
# 11.SQS
# 12.Route3
# 13.VPS
#14. Cloudformation
# 15. IAM

# Usage: ./aws_resource_list.sh <region> <service.name>
# Example: ./aws_resouce_list.sh ap-south-1 EC2
#########################################################

#Check if the required  number of arguments are passed
if [ $# -ne 2]; then
  echo "Usage : $0 <region> <service name>"
  exit 1
fi

# Check if the AWS CLI is installed
if ! which aws > /dev/null; then
  echo "AWS CLI is not installed. Please install it"
  exit 1
fi
# Check if the AWS CLI is configured
if ! aws configure list > /dev/null; then
  echo "AWS CLI is not configured. Please configure it"
  exit 1
fi
# Check if the region is valid
if ! aws ec2 describe-regions --region $1 > /dev/null; then
  echo "Invalid region"
  exit 1
fi
# Check if the service is valid
case $2 in
  EC2 | S3 | RDS | DynamoDB | Lambda | EBS | ELB | Cloudfront | CloudWatch | SNS | SQS | Route53 | VPC | Cloudformation | IAM)
    ;;
  *)
    echo "Invalid service name"
    exit 1
    ;;
esac
# List the resources
case $2 in
  EC2)
    aws ec2 describe-instances --region $1
    ;;
  S3)
    aws s3api list-buckets --region $1
    ;;
  RDS)
    aws rds describe-db-instances --region $1
    ;;
  DynamoDB)
    aws dynamodb list-tables --region $1
    ;;
  Lambda)
    aws lambda list-functions --region $1
    ;;
  EBS)
    aws ec2 describe-volumes --region $1
    ;;
  ELB)
    aws elb describe-load-balancers --region $1
    ;;
  Cloudfront)
    aws cloudfront list-distributions --region $1
    ;;
  CloudWatch)
    aws cloudwatch list-metrics --region $1
    ;;
  SNS)
    aws sns list-topics --region $1
    ;;
  SQS)
    aws sqs list-queues --region $1
    ;;
  Route53)
    aws route53 list-hosted-zones --region $1
    ;;
  VPC)
    aws ec2 describe-vpcs --region $1
    ;;
  Cloudformation)
    aws cloudformation list-stacks --region $1
    ;;
  IAM)
    aws iam list-users --region $1
    ;;
esac
