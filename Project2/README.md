# Project 2

This directory contains a cfn template that will get you up to step 2.5 of the
[Create A Basic Application Server Stack](https://docs.aws.amazon.com/opsworks/latest/userguide/gettingstarted-windows-basic.html)

## PreReqs

A personal AWS account

## Deployment

1. deploy the cfn stack
    - set stack failure options to: preserve successfully provisioned resources
    - on the last page, before deploying: check the "I acknowledge that AWS CloudFormation might create IAM resources with custom names." checkbox

2. upload `iis-cookbook.zip` and `default.htm` to the bucket created in the cfn stack
3. From the OpsWorks stack created in step 1, create an instance 

## Cleanup

1. delete the instance from the OpsWorks stack interface
2. delete the contents from the bucket provisioned by the cfn stack
3. delete the cfn stack