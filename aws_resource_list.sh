#!/bin/bash

# Author: Venu
# Version: 1.1.0
# Description: This script lists various resources in an AWS account.

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it and try again."
    exit 1
fi

# Function to list EC2 instances
list_ec2_instances() {
    echo "Listing EC2 Instances..."
    aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name,PublicIpAddress]' --output table
}

# Function to list S3 buckets
list_s3_buckets() {
    echo "Listing S3 Buckets..."
    aws s3 ls
}

# Function to list IAM users
list_iam_users() {
    echo "Listing IAM Users..."
    aws iam list-users --query 'Users[*].[UserName,UserId,CreateDate]' --output table
}

# Function to list Lambda functions
list_lambda_functions() {
    echo "Listing Lambda Functions..."
    aws lambda list-functions --query 'Functions[*].[FunctionName,Runtime,LastModified]' --output table
}

# Function to list RDS instances
list_rds_instances() {
    echo "Listing RDS Instances..."
    aws rds describe-db-instances --query 'DBInstances[*].[DBInstanceIdentifier,DBInstanceClass,Engine,DBInstanceStatus]' --output table
}

# Function to list CloudFormation stacks
list_cloudformation_stacks() {
    echo "Listing CloudFormation Stacks..."
    aws cloudformation describe-stacks --query 'Stacks[*].[StackName,StackStatus,CreationTime]' --output table
}

# Function to list DynamoDB tables
list_dynamodb_tables() {
    echo "Listing DynamoDB Tables..."
    aws dynamodb list-tables --query 'TableNames[*]' --output table
}

# Function to list ECS clusters
list_ecs_clusters() {
    echo "Listing ECS Clusters..."
    aws ecs list-clusters --query 'clusterArns[*]' --output table
}

# Main script execution
echo "AWS Resource List Script"
echo "========================"
list_ec2_instances
echo "========================"
list_s3_buckets
echo "========================"
list_iam_users
echo "========================"
list_lambda_functions
echo "========================"
list_rds_instances
echo "========================"
list_cloudformation_stacks
echo "========================"
list_dynamodb_tables
echo "========================"
list_ecs_clusters
echo "========================"
echo "Script execution completed."
